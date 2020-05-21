perl << EOF
sub checksize 
{
    my $count = 0;
    my $startfunc = 0;
    my $filelen = scalar @_;
    while ($count < $filelen) 
    {
      if ($_[$count] =~ /^function/) 
      {
        $startfunc = $count;
      }
      elsif ($_[$count] =~ /endfunction/)
      {
        if ($count - $startfunc > 100)
	{
	  Vim::Msg($_[$startfunc], "Error");
	}
      }
      ++$count;
    }
}
EOF

function! L1( )
    perl checksize($curbuf->Get(1..$curbuf->Count()))
endfunction
