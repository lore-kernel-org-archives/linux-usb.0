Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938363B7B76;
	Fri, 22 May 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441816; cv=none; b=TcsJI/dEhBEpDQCWDi2vf2KEA8FPCdy7dhIwRh7p0fs81uozGY5h97SpL39EBL1147Vf6GCjRGRfPVTf5d7LgNRVtk3xMN2MNDQ2r389YBxkzASRlDaMSZykJEpCmdCZNGZMLEQHZmWIQPp2mPqoH5BaTLBJxP/gRdpmraSFh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441816; c=relaxed/simple;
	bh=m2NKcB6TLHjaSaT162xrmKpvge/X2ahpM/ak03ngy2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUPrRJOmY75LyanwAs5agFmgAx6gjKU2p3UWvBrUflqq1/bRl8hwc2ETXXXrzsgF1Pfvo0ywTvosrLdbn/sM4e00k97NT4f/+Q08rTq3rqfnknCZREXRBC5yNoYI4MdahzCTOAnRto/4NtbkdqkemA26H+cMIrnvFmfX0qRnFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RcS3MadN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RcS3MadN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4A61F000E9;
	Fri, 22 May 2026 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779441815;
	bh=tdP9f+4CdyupRq+vjIaYKbxnzDyQmwF7Lcej1qmpQ7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RcS3MadNcqrhlsAjPOcCDdKXGN7mGmjwhPBvghAvYyOQDptxuNgWFEcnckcDad+CJ
	 TbXnDQIKfkdF+jfJJ0rKrVAnk1GI2pMEEjZR0TTSzE3o42BVcIkwyeEAk5U1D3z3XP
	 1zrs5PsUedLFRxOZ5At3SAk0MJK7pF0u8PpDmUzs=
Date: Fri, 22 May 2026 11:23:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	George D Sworo <george.d.sworo@intel.com>,
	Matt DeVillier <matt.devillier@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: check for a pending command completion during
 command timeout
Message-ID: <2026052213-deserving-oppressor-bb81@gregkh>
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
 <20260522085828.24142-4-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522085828.24142-4-pmenzel@molgen.mpg.de>

On Fri, May 22, 2026 at 10:58:27AM +0200, Paul Menzel wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> It's possible a command times out even if xHC hardware already completed
> the command. Driver is unaware of the command completion if interrupt
> handler is blocked for a long time.
> 
> Check if there is an unhandled command completion on the event ring during
> command timeout.
> 
> In this case just give the command additional time to complete. There's no
> point in aborting the command ring to move past a stuck command.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
> Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
> [pmenzel: one adaptation for mainline 7.1: next_trb() uses the
>   2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
>   dropped the xhci and ring arguments present in the 6.12 source the
>   patch was ported from.  xhci_pending_interrupt() is used directly as
>   it is now committed as the preceding prerequisite.]
> Assisted-by: Claude Sonnet 4.6
> [pmenzel: No devices with the problem available, but no regressions on
>   Dell XPS 13 9360 and QEMU 7.2.0.
> 
>       qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0
> 
>   xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
>   hubs and USB mass storage device enumerated without errors.
>   The specific race (command timeout with blocked interrupt handler)
>   cannot easily be forced in QEMU, but no regressions in the normal
>   command path were observed.]

What are these additions from?  Did you mean to send these out to the
lists?

confused,

greg k-h
