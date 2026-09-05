Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054AF1A5BAE
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 02:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575841; cv=none; b=oqOci4Ixuad+DBny7giBbfpstFLmBuM6jWDkjWcu5Bb/qdKgfa9UfGyUgD0i/lo2UVlFcLgUoaPQekZMhkg0j5FM3HroIXyHw8NORgZ+w/xsb/KCSKl2oBJmhGpo8uyP2RPxTFTOCb9ILZpfWRZHyBeHDxY8nfdo/K/yXJHT8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575841; c=relaxed/simple;
	bh=wquW73nnBwWT6XnD+X/Pe7ShK7x7XDj8Y7JBFd/eb/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxTHsyVQQfiHlZBFSbArC9z9dAfJKjox6EzexXZqiJAVk+73IQ6yt+iz3q+7C04BttA7DHCNdD1fS8EEB5jbbsHGC7Sdyt+CjZyt71lE6Y5Xm8JIPK75iuD+NZoJA5gaUZAh9rGDsQbgQBFDjOqIKzYNgcoN5Dsw7GByL6CBr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kFvZp8Ge; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kFvZp8Ge"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53031a57d7fso18856831cf.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788575839; x=1789180639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9w9CEy1DQ4ao93Pe4ROwaoUm/boruq1IRty3oKe6EUU=;
        b=kFvZp8GeJt+dxSRLgvQ3t+Dx3U7qM72zhme6hYyVbLWdoc1trdrLswWsw17loWdits
         zmNgfG05ovuBHX9oNVLLM1fy1a9gYBv2aN+I2horU1L7oHuuvS6hIdexPKUfHuoALHxf
         JbY7NhzUwBalqtVMfSOCm+PV0ctep1PfsWPCmToBSallndG3gqpBIUP1iarRwPguUEhI
         CqNqaKhY7WMuSQNktxtP2PYvDqBYg7/Etu6UaQ916dMMvTBPlMod9UuxSEmSpqPWGrc3
         kYpD8GzgXMhjM7a9pganKBWWh6NeOU+urCxDTl+4yuDC9vFcyKtwhf9Jdz3z0iiaUjzq
         SKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575839; x=1789180639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9w9CEy1DQ4ao93Pe4ROwaoUm/boruq1IRty3oKe6EUU=;
        b=eV4QifoXgTz92x8B7yyRbdMRe8GH8ToAY4SGDzGk7nMGMJcFI4wmwGfnwO37zh8OKt
         Fi4hmryzPuzVz3JHxDNCuU+xeg8SvSPZDpAhHS1A+IuNuc4y+s4ZccRBKpa3BYI5r94W
         WNcbT6y7yJplETtxsKKhCc33RSNGoWIPzyhE3x/AbTXPIXTWJpYIzVCaKjDEfkX3qvjk
         B6LXAbcCQ2/j5knLLIHP9DklXJBzLFfH8HEqrmkawHFRy1DmQ1t/1hqpo+Zm38B1cUIH
         ddwrAicD8JF/B5bH8P2BGVA6X9/ksdaQrcSQM1AVNXEYh1HeN9ViDTJFnGpLgZEo1+Tg
         iCRA==
X-Forwarded-Encrypted: i=1; AKwUvBzsAwu5KBmE2SzCCrwkClYulENaneGWmwc8SraDX4tqDFN5us6KXWpv6OQGHUPy86DeIn64ORf1S6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lP0hhbo5lSO0gwJXSxSLXqu6402PR2GnnEwaO3/OfhvjmBqhd6
	aVukAS6T4pGxVLdoKG+jXRh3oq+QxHemODyYqa4jknbdDxDRKEdm7MAuBCYATlHd0A==
X-Gm-Gg: AYBFou0UUMpkx+PAEsaWCTjwbERAV250HV22KNWGMyiEIefWh5U9Hw1dhyj21q2A+Uk
	PVOpK7u8mZpstqLbg0N3u6pix7UdTduAenbJy3LDWnsAv2oAFX/qP/jqfQnt+mqgq9MTt6xrHXR
	ZfWY+SOBT1z4wfQ1F4Xm7TfOwJeHGw+PNGspa4ZGfcTNvDGyHxx5So5E3Qn3aKOk7YsTKvpti8z
	5W1hewLI2rrj4YFFnjQLddg33HzJTSwQSG1tCYAZbm9PAfN9COpAiVsRxyaJGG3qbVdSHP0/6H0
	Bnu9/18LIK7tmjiNnsMt3aCRKR5RN3gjJ8rNIMAcSKVXJWF+o70ZlfeScVtQ4A1tf0q1/0+kbbD
	gw62y0Ckh2nisjXcRP7Xn9tGU33KhCRAqW4pvGFWypLqvj2BDaI2weCl5/nYymYzADHZfVgpJqX
	RUujVKoux5HgIQOXkylZ30yhv4bM8U+VZTQ2cyP2yFgjt0KNrrW45neyeLjrbPKdA=
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr115702161cf.48.1788575838780;
        Fri, 04 Sep 2026 19:37:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bf8c3sm35302066d6.48.2026.09.04.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 19:37:18 -0700 (PDT)
Date: Fri, 4 Sep 2026 22:37:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Arka Mondal <arka@arkamondal.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
	Daniel Drake <dsd@gentoo.org>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	arkamondalofficial@gmail.com
Subject: Re: [PATCH 0/3] usb-storage: alauda: fix DMA from the stack and two
 block-map bugs
Message-ID: <0a60fe87-181a-405f-a758-90883ea7c60e@rowland.harvard.edu>
References: <20260901065831.43567-1-arka@arkamondal.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901065831.43567-1-arka@arkamondal.net>

On Tue, Sep 01, 2026 at 03:58:28PM +0900, Arka Mondal wrote:
> The alauda subdriver builds its commands in stack arrays and passes them
> to usb_stor_bulk_transfer_buf(). usb_hcd_map_urb_for_dma() rejects a
> buffer on the stack, so on a host controller that uses DMA every alauda
> command fails. Patch 1 moves the buffers to us->iobuf.
> 
> The first command to fail is the one that builds the block map, and
> alauda_ensure_map_for_zone() ignores that failure, so the next access
> dereferences a NULL map. Patch 2 checks it.
> 
> Separately, the zone index used to reach those maps can be num_zones,
> one element past the end of both arrays, because max_lba counts physical
> blocks while the index is computed from usable ones. Patch 3 bounds it.
> 
> Alan Stern <stern@rowland.harvard.edu> wrote an equivalent fix for
> patch 1 in 2023, attachment 305027 on the bug below, and offered to let
> me post it. Patch 1 here uses us->iobuf directly, as the other
> usb-storage subdrivers do, rather than the memcpy that attachment uses.
> Alan also diagnosed the NULL dereference in comment 11 of that bug, and
> suggested the reordering that is half of patch 3.
> 
> None of this makes the card reader work. Alan has said it may be better
> to mark the driver BROKEN; that is a separate decision, and these are
> bugs in the code either way.
> 
> Compile tested only; no relevant hardware available.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217862
> Link: https://lore.kernel.org/linux-usb/20260821080951.39905-1-arkamondalofficial@gmail.com/
> 
> Arka Mondal (3):
>   usb-storage: alauda: do not do DMA from the stack
>   usb-storage: alauda: check the return value of alauda_read_map()
>   usb-storage: alauda: fix out-of-bounds zone index
> 
>  drivers/usb/storage/alauda.c | 95 +++++++++++++++++++++++++-----------
>  1 file changed, 67 insertions(+), 28 deletions(-)

For all three patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>


