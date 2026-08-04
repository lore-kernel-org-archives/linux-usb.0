Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6F378825
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854801; cv=none; b=Hc9kW60HTjMQnWTI+1jVLtRpCC73+jxHmq8RsXqSk61tqBTsRdNdeNSeo1ZnFRpaZfokxVVHUw1v9km8PuR0wtyCeDiIufsnqIFlZfTJ3nLkTWXUVSkeQS+VOMO67e+u//6w5X1uMtKykhCExtwhjXzRKAYNIMUgNeYMPRU/KYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854801; c=relaxed/simple;
	bh=aPo5DBygC7IpWnobwmQCfUlSg3ZbVgU4en2Z1sqx4p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDLsD4yHI8WT4FYng1pRyG6hgOpJ4WTUIRknHVJgIKM+YspiqcIDSERSiX2cTGKayvFaJW6OFZ20iC/B6sa9juO9j5Wcq4aQlH1HM+bEbU2NM+xrTdad+MJ061bm8FA/5pwKMH90eSVdaIxsVev5RJ9PXvzcSS7tD4HqcAale9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBRSQxN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBRSQxN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A931F00A3A;
	Tue,  4 Aug 2026 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854800;
	bh=pnMlFnF2guDapjRMX2durArQPwbMWdy+4S7e2oh1eTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBRSQxN2TmClVW97tArNcR9vxPBur0wj0ZaCIhHHqWTxc9gja5SJuWeMETGC8kEU0
	 u3i27CXqZkkNVblMvyNWpod4XKEZssVUlvDFFmIycQsrIuStcbX8a6KkOZovFwG8L3
	 m+q+7rpE9ZSQTX5eqqmOiuAV/hYbBgRjLqmd2W9hEnedZlZxxNhWJBS3BJsu9xS6o6
	 EEoGcdiJoVpULXreUTDl2PO9342ASnXlAxKZgMXDsDlrtrd/U5JM4kZD3JvsBvwKDv
	 k8FIBmYODfDsmv+Dpn5XEbW5ckdAzQoRKzSiKzS7mi00wMDICWb1rVWYFlfTvkOC7x
	 c48vj1eAW3csg==
Received: from johan by theta with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1wrGPd-000000005io-1LoC;
	Tue, 04 Aug 2026 16:46:37 +0200
Date: Tue, 4 Aug 2026 16:46:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: digi_accelport: fix crash on SPARC
Message-ID: <anH7TXZF_C7xa6q_@hovoldconsulting.com>
References: <20260804105150.576159-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804105150.576159-1-oneukum@suse.com>

On Tue, Aug 04, 2026 at 12:51:50PM +0200, Oliver Neukum wrote:
> The helper function cond_wait_interruptible_timeout_irqrestore()
> reenables interrupts. It does so by means of the flags saved
> by spin_lock_irqsave() in the caller.
> On SPARC these flags can be used only inside the same stack
> frame. Details can be found in
> 
> https://www.kernel.org/pub/linux/kernel/people/rusty/kernel-locking/x467.html
> 
> If the compiler decides to not inline the helper function,
> the kernel will crash on SPARC if the helper is executed.

I too had seen that comment about the messed up SPARC, but some years
back I looked into it and concluded that this hasn't been the case for a
very long time.

Specifically, the comment you refer to was removed from the in-tree
version of that document in 2004 after SPARC was fixed.

Johan
