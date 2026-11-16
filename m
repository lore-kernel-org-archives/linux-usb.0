Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855076;
	b=dbPPwyNDN3J5gfDqCM8ao5sqrLQ7DOtrlYS1DLVOwtG0LftXP1GRYR9T3FQ53ZFJ9lxC
	 GcxoOK1v1hW9JhLShgPbuyez/RrdPG59GBvJUst+mBJEDzNFQFMa/+1wsg5LxWMWNanfl
	 shYy8VWjBgzxyP/wSns8cBeITstVyjdvacgC3gm/PJ4QOXYewWZ91LgC3GfxD2eCtbLZk
	 NjwoJYLwuc045BpSDFUPIvGmvPrCTqmmZf1Fd0R31QhX26KKLVpYs/RSqcUrG7Nmp/8G1
	 aYd7PHIrUr4Iqs8j6IWIrElK27GzzvXftCV0KjqAoZy25JdquqQedutIxEy7KswVBMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
	b=zmSdbuVZxC417QNYdjj4gE1JEd2vP3vgQx5cl600g6vSfSsbyRooTUxlgtZFnuzZemtZ
	 IlnJK10c0P8hneC89BlhkVBEJxx5f6VIck910skqSjsp7Efu5aWKvAr05Ke8thUO7UjuK
	 jBnt9mSIZKggk/jyTKYRyFwSfo5ISHuOpuug6FJL0Jfax544rXZuTzruBEobfuxcb39hN
	 YXsr6PuUEl5t4gjkFITCKEjpo7lT0zY4/s8tU0JgENILtBiVFvwZs15nkjhUvbWjooflb
	 HgRPlB/kqEGbkePRzRYfF+QjpI1uZtN4E/ZjSw5a8RuY692VxmSJYfd/0YwC+YCPYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=RqasTIrB;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B9606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=RqasTIrB
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c35262674so21059781cf.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794855075; x=1795459875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
        b=RqasTIrBSzc+pvM9KGxD0Wr33AoXUUv1zyExX4B4tgAyv1V1PFaFeiSw9ux/9T70MW
         x+HS4845fh5pUxQ01QWvbLQfvUziHiq9CBYZTe/K/HAyeEZ+C0HihAlsW7NVWIyraRLC
         CzTsQ5A/oXzCq9h2q65GaQGKmD5TS7ojd6kpJe0J/n9lzSSi3iW+8PeSnVc+Ig5Wac6h
         aWjLrm6GfzrjNLFGjsxn0Edhqy40Xjg5T1ZDvWfw3Epc8yjbd/Foc3nnE3g6xebWZbVg
         SG1Qxjbc+M+zmZQEhDWkJsx8/cJ3GypSrUoo3lkXZZ2s4QQw7m5C8hcMZ45Grr1jk1Mj
         hNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855075; x=1795459875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
        b=LLWIL1+5GTZ7IXBwp3dmUNoaSpLZyrrnkJPfh0A3k9iAZvBMxLBCB4EYhFStIWECAq
         Jp9XK0PFXE80ADY7i1wjN+J5SOUfoSHgVe4KrDZx6UpY9nB71shL+znkf/zEjvFYjTi2
         K+wDOSbFAf0Vg8HfYWUD2QN3gVMjOEbqykm0h/1AWt2zt0/qvsIGTLrqf4DxF23Hznye
         b2tKl9r88L8eVEshQuKfYm72xvPA1N0mGJxZZvLfsMCInE/5aL1g62dDRlaXiC9kqJIv
         eDwQqEd7I+QB9ORv50ifxxWz8+ze/3x+7MVgjimPjpplAikByOgmLSdWf6ECZY1xQ8Oh
         iMVg==
X-Forwarded-Encrypted: i=1; AL+hErHww0OnoaYiwQbMac0hkKiGMaQRxnuJqNvl4mb8hylnFwuDZ1z+Cjg4m8O+A8Xq8k89OWXfi/VhPMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jELhFGay6CPFOdbjl7BVvWUFJgTxTfkpeIHE8iWaKBRsNc+K4
	J+MilCfo1mgfGwwJCvAhshIDrWX56p7n+VnuFPtXGNmaiGvImIsE5QWj1q4DVKU2wFRhHgvVE4D
	XrC210A==
X-Gm-Gg: AYBFou2udADkK5CfPZFaQMybEFFPBD5Kb+uEQDAvqS7MO5H+o3jn9WP/RuMU2g0rHG6
	Z3RJ3EaGWqrSVSrMp8uL3RSMkWDF/CoeUJl159vkO52Cg1LrTALpoinkvMEy7Xyw+9qXD+rQan1
	SROzH11J0US1kQkAMDdyR+7f1dmfgo+LG0fkYzwYKyBHpVOCcpUPnSWYoVYOt2tsx+ea1CQoaDD
	1ZoqGg40UqA5W9z8BwVLfLaWGCGeWAC63bOjrne4qsvS69bAEnaj3FxipPzfR6W3i5UJ9XT/Fvo
	tff1GNElKfUV1XYAbGRmSogBoIddKivqU6OcgLQ6gDxFpCFEO03e7/EPIuztjQhBGF/g8bWO6Dv
	rvKCdWnsIj3BUBbCj1vIloAm6A9oKdOKT8RyOF7/d/uA6hrDgD2GmKaQBhd49fEr/uiPCB/gsBx
	a4XdgtdPnVZ4fZJaTjw0vz+qU51s8UoxeAzwXnm1/hGbiOckyJZ8iBAIa3eow5oW1SCHGnaR2Q8
	duu+1tZSSYYzuBdnNJwmtrv6CMh65sEvL6rA+xOIDzvvp3BX0CBaq9rl7H4GqLgX5NyJe8hvG9A
	3qzv1Cc6/W42HA5t+fW74A2DDdUFb4d6R9sSeLw6coBGwG/ENi0=
X-Received: by 2002:a05:622a:1b8e:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-55ac9f6070cmr183600311cf.69.1794855074811;
        Mon, 16 Nov 2026 10:51:14 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34f869dfsm37676731cf.6.2026.11.16.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:51:14 -0800 (PST)
Date: Mon, 16 Nov 2026 13:51:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: core: wBytesPerInterval checked with unsanitized
 bMaxBurst
Message-ID: <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
References: <20261115163701.226491-1-teel4res@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115163701.226491-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 08:37:01AM -0800, Cheng Yongkang wrote:
> Hi Greg, Alan,
> 
> I hit a corner case in usb_parse_ss_endpoint_companion(). It needs a
> SuperSpeed device with an invalid bMaxBurst or Mult, so it may not be
> worth fixing.
> 
> usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
> Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
> wBytesPerInterval check from the original descriptor. The stored
> wBytesPerInterval can then be larger than the clamped endpoint can
> carry.
> 
> With wMaxPacketSize=1024, bMaxBurst=16, Mult=1 and
> wBytesPerInterval=65535, bMaxBurst becomes 15 but wBytesPerInterval
> is set to 17408 instead of 16384. usb_submit_urb() uses the clamped
> values and rejects isoc frames above 16384, while
> usb_endpoint_max_periodic_payload() returns 17408, which xHCI also
> uses as the Max ESIT Payload.
> 
> On v7.3 with a virtual SuperSpeed device over USB/IP, the kernel
> logged "setting to 17408", and 16385- and 17000-byte isoc frames
> failed with -EMSGSIZE. I only tested the bMaxBurst case; the Mult
> case follows from the same code. The code is unchanged in
> next-20261113.
> 
> Using ep->ss_ep_comp in the max_tx calculation fixes it:
> 
>   -		max_tx = (desc->bMaxBurst + 1) *
>   -			(USB_SS_MULT(desc->bmAttributes)) *
>   +		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
>   +			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
>    			usb_endpoint_maxp(&ep->desc);
>    	else if (usb_endpoint_xfer_int(&ep->desc))
>    		max_tx = usb_endpoint_maxp(&ep->desc) *
>   -			(desc->bMaxBurst + 1);
>   +			(ep->ss_ep_comp.bMaxBurst + 1);
> 
> I can send a patch if you want one.

Please send a patch to the xHCI maintainer.

Alan Stern
