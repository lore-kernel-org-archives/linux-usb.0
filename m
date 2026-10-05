Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389484AD4C8
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231694; cv=none; b=F+h+IO0xE+8TeC09a7oyATyJWvFMpBUK9TsetX7TJSAi5UCcLLn6i1vlGHsv9vQ8CsLBlybayoaA2/lxPssCn+dCuVPpHeS30+S6Iw3chKUl9Mkjp0HHsXbEzPHR6qMqm+807By2/OytGAbH9PlqYjGQtepGi2Jh1B/kEwIRrjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231694; c=relaxed/simple;
	bh=PUcIwL3sxWUwjUkEHic7gqrYUOt1jLTq7TaXf5gQV1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptShEAiPcqzvFel0oZ4AEqj03A/2OnNbRlEyWlp94DpICPHAQNee2H7FV/N5w2iDknkrSq3tNqI8qNBxFN3m3EDHohp/GqzUM8bdnS0fANQ1xlF6vXzR3XEOcJSZaj/a35spLWI63oFD1QiN6Yt6tvw3984VVjJ3GjxB+BwZZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1z4OWK3; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1z4OWK3"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c54d65743so1385467f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231690; x=1791836490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oCVDgOpACssiVJGI1HFqtgCbfd9PUTK46z2UhBdQ0c=;
        b=H1z4OWK3EBJF0tGgoc80OzzvXkSXH7Wjh/+NIdl65GWZHT0B8QPkWl9GnUAW+JqT8U
         LKMDKRUvXG2ytTjDV+m0DxwKYP9fyAneEc8i8atmhZchqTwD5C+jQyHomNkQGDz+MLK9
         a10N/DHxK4f3c48jw7/tjHjZnZfskCqaK9tEX/Gqg9CJihl7POJiyGWcJh0dCX+a/Q2F
         4KlGEouQf5XHN25mTX6zB67uvLwPZyZWeH+RErM5JMl5WkIM2rbSF+jzE4BO/KcZg2bk
         22EtbO41HbWaLJKYW/BGQ8mhkX++hj9vW1yyLawIlrdvegBKIoZTBB4dMUjGtvvDFsrM
         h7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231690; x=1791836490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oCVDgOpACssiVJGI1HFqtgCbfd9PUTK46z2UhBdQ0c=;
        b=Ce76HUzFyLXptwC97O6eHTCgTKGpnjAtCcC1b/Xu8goqtB8M8Kf8QW24sSDXQTM28U
         z0W9c36sucmwi6Am1yEP5PXIC1XLqyF5bIn2uOnRpOv/Y3GwYdZ9UbQSIyHgMU9dqt2w
         LJo1C+/dzK+SN8LPa3ay6Z6EPUGqvNcUpOWywIdvKCj8uG7eglcloW0ygSrSyFun9F+5
         Mo1RVoJOhiF2wrHiiSlF6ECDYNxNc9q/hEsSaQRhWCT04pc+c8SOLNmDz2U+yvdmJeQm
         ApXwe1LLFSRrTYExOGiz5dKBVs+wfd2SlHLm6sJ1iGIRNh2FFBpCG43GZIdGofv8e6eQ
         OVag==
X-Forwarded-Encrypted: i=1; AKwUvBzOkZiHm9cvWwBVVvvMLroJ+u/dboksNlj3sm3HM0r0jsEBzRTFpzmQEABqgX8Pd+qSwP34oTrzrZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8ucdntFV2PEUzl0LPHU9OjnUVAQcepOTr/DjtRTZ43ZfthDTB
	6iQFIdO9pEy0dK+F4tx6WkNu0J9g78h5DZgtlX9/SQ5n7dlJRw2jKe7bVVar5RAe
X-Gm-Gg: AYBFou2OA8K+c9O9FI3esR2P+CtCnDrsNHQObogXZ3LCo4OIKAAZZalQsqgsolOS8Rh
	G1Swga9VuI2x7uPMsDXooHZFxDMilU+lwZOWVUgkuLNZsxztzbUtOIpPFmHy84q3AF4MZ6KfOIy
	iMDk66cAd9h8EdpU4Z8LZYlfF2vfnnV+8VDFxx6snskpGJO3X3Gaevh2i9LGrJT9yGh+jEl8dgk
	IFvHlllAO46+MHT/z4W0JOw+Xe2lCbXBo/ZDNdE4l+cIQWhriC+GEhXNR6XBUboni44WIvuBnMr
	qY1g4tSvUghqvLjg70i1skymyjflIOFpKikVkHc54GxKYpo8NTvT1eH1o+JLYQRvgtwhWRz2kXf
	vKaip4t+vJADgYvMPA/stGrv8NDaSpSiU0Qy8VY+rlYL8O+mfDE4zMJ4fsIEjwRwjnpiXuIguia
	k9YJzwKx+1DZjTeNcPbmre6ij0qo29z05N25CWSKlngYHeovTRUs/MQr9lrmLGqPfZPyA9NR8hL
	FFEdLCJ/Gffpw7MxoURuAppuDFS4Y1+QTOJhLUXU9+QU28rJ45E56ZNvA9T7xvykKxVv2ibJgzC
	az9pO2WYs/VE8nMIpdi1WhezBH3dHbf55opHCRDdzQRBiMXHTMdSNuwtXMMOczSNFGjIJHzO6AU
	=
X-Received: by 2002:a05:6000:186c:b0:48b:910:3598 with SMTP id ffacd0b85a97d-48b12712e23mr24557006f8f.22.1791231690251;
        Mon, 05 Oct 2026 13:21:30 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c63550d1esm5541308f8f.18.2026.10.05.13.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:21:29 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:21:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asQGIQndPhFVaTNX@gmail.com>
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
 <asMl-yIKQoAbpwzA@gmail.com>
 <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>

On Mon, Oct 05, 2026 at 03:57:42PM +0100, Geert Uytterhoeven wrote:
> > The words before the last one are read with ioread16_rep(), so reading
> > the last word the same way puts its first FIFO byte first in memory on
> > every architecture.
> 
> Hmm, the version in drivers/usb/gadget/udc/r8a66597-udc.h does use
> a single ioread16() or ioread32().
> 

That version takes the low byte of the ioread16() value, which is the
first FIFO byte only when readw() swaps on big endian. On sh it does not
swap without SWAP_IO_SPACE. The boards with an external R8A66597 are all
little endian, so nobody hits that.

ata_sff_data_xfer() also uses ioread16_rep() with a count of 1 for its
trailing byte, and i3c_readl_fifo() uses readsl() that way since
d6ddd9beb1a5 ("i3c: fix big-endian FIFO transfers").

Thanks,
Karl
