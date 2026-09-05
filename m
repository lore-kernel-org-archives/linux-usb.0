Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF435474E;
	Sat,  5 Sep 2026 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643023; cv=none; b=o4pxykxN/lhc09TvIJ9Qts/QKu8WlMS36JMprRhhVZVVpeLTRA8MBumsnH3R6XcC0aeQaNqTjSAlArrFGe+PYwW4rnzQV3p0rsie60d2P80UDI30eR+GH0pSk9PVSaVR3IGzzrCiqi/kcTW1hyRLYSLTcC0d7JfVLblzaLBHKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643023; c=relaxed/simple;
	bh=IALzogT7VzQqgpIelQEH/MdStmQmglBR9A/MSBTCToA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICXPal0DFpnTdXNV0l5c5cNUCDm9FuSDhr7EDQhGDAWvK0XQ6VhdKqKRw6qfz6t2Tv7WAJTnCqq3uklON0rOts9Poh2iJgbfYPtXBUWm+lpHu0UZmspIXzJ5oJodu8aOUK4RKEItCf84OlXi5rzrKtdIafNtfs1UWR2uUAHGj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uK8ywYtB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uK8ywYtB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dT1MRUJRlxEtSEwAI1JRjR/My8mNOQCJOx1W2ufmhLE=; b=uK8ywYtBSBuerJZz5Eb0s+IAjY
	v1e7kCx2MMp+ldSoOlYzDYnys/WR5j0udN/rqNzJLoCd5CI3WW/8tfNf+7JOwpx8cissvk1PM0rt7
	hqAg3PmPU8LnuQE+8nJ+1E7cWPfvE4Jw6ZBBCjm2AdyaNcVA0A3n3wXiq2UBymKuwGl3ldTfD6F3q
	bQlqZ6LCVVnivunUMPrJ+1MkgN6YzBDX6W2OT0oasH31H4+OTIWpsUPwyU2MHGxQlhZzANrFsymFn
	oreLX2+TTiP9XaBVqPbwFpdyiZilzN+Ns9Ltq0/vB+jqo99kwsYytP1YyfGhLHE5AkfUqgoCYaqzd
	cTOYme5A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xko-00000004QFr-3Xd0;
	Sat, 05 Sep 2026 21:16:50 +0000
Message-ID: <4b3da317-38b7-4a98-a46a-7bc308de1546@infradead.org>
Date: Sat, 5 Sep 2026 14:16:50 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: usbmon: Fix a typo in the example
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pete Zaitcev <zaitcev@redhat.com>, linux-usb@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260905075609.32879-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905075609.32879-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 12:56 AM, Karl Mehltretter wrote:
> struct ubsmon_packet does not exist; the name is struct usbmon_packet.
> 
> Use struct usbmon_packet.
> 
> Fixes: 6f23ee1fefdc ("USB: add binary API to usbmon")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
thanks.

> ---
>  Documentation/usb/usbmon.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
> index 6d5ec1e62d09..667b84d3ae56 100644
> --- a/Documentation/usb/usbmon.rst
> +++ b/Documentation/usb/usbmon.rst
> @@ -361,7 +361,7 @@ Then, execute a loop similar to the one written in pseudo-code below::
>        ioctl(fd, MON_IOCX_MFETCH, &fetch);   // Process errors, too
>        nflush = fetch.nfetch;       // This many packets to flush when done
>        for (i = 0; i < nflush; i++) {
> -         hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
> +         hdr = (struct usbmon_packet *) &mmap_area[vec[i]];
>           if (hdr->type == '@')     // Filler packet
>              continue;
>           caddr_t data = &mmap_area[vec[i]] + 64;

-- 
~Randy
