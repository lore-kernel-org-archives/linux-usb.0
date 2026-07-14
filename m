Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E581E1C11
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047265; cv=none; b=PqmDDACQ7lr2ET1+9qUlXVcinxwg6Y0GEqGvI18uJypgd0EMOhgoWBVY2YjSSXOIJ95nypF9vVEcicyVRyEU8iCj0Avjx1i1uxnUitoDMNZ8C6e3diF0BKnOcxrdQeSn3OHCCG/LVImiIOE8GRGwfYe2f/GzY51fRBvSaJdqz8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047265; c=relaxed/simple;
	bh=1N4fj2z38fG1hJdBCBE5l1t6/C4jAwKabWInF9zIVBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYIXhfjt12GqI7YdlmLRT0EWsOHFWRCYsQeD6glOlcpdN7IJrY7s2TSXZHfFDGUIBcRRdm3jkKOApjWJ4/ANbwPNVk1/exOUj4vvahbhstWRLPAf7ennOtEkVu0RikKoSqKwL/zFaZa51/WM3SMzle952wtx5QqwijowoCapLCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gLz8XVle; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gLz8XVle"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f29ec73064so39970016d6.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784047263; x=1784652063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dn31gKE+uz/yKY+AM6zNeho/2yhkLBz1nQFwzMg1Lw4=;
        b=gLz8XVleloGddq+tHN3HKgCBcfnnpBtLxe679yeCmwbKjWHQOvdRl0QNr9V7b7CfTz
         jJS/wXG3Sl/nV5SLpoQrbxrj1PcORZbPrupiAjzmh/fCbm2F1gjUBVt96zM6ONqw2VEN
         X75hnpebuW3dzzbvmn9KAlNUX7GLk+Q4W+16TSc1Wgc29zpCssbIVF+eLLVJgLBUhwvM
         dHdJrurTvpye6d8q+hUZWzAxi18p/rW+1UhWeYqwvUV+AufveGJ/ejPxWcFm3IOcVEFe
         NIGmM8QMBvr+tcRhGv6XwUTQ8NlqF++JoWgIz7r5Td+0wTtvReO1zDvnIcytNcIBCKEO
         XkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047263; x=1784652063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn31gKE+uz/yKY+AM6zNeho/2yhkLBz1nQFwzMg1Lw4=;
        b=qaIC1juKrV8FvXJ2cht1VulD4nYo8x/t1wdqQVKSSbIYJMmh0RsgEjB2iVaDV9XJHk
         jCHLEAQV7DRSsSAjNMrB25KKC6CyE8G/62D1LiZioWxvdMlG14J3pHcje1pGWvik94tu
         JdXEMryfId7t6Sg3cBFc5JrNxTFhB/xp7zsVrXZlr98kSPaljnaCbrP5103pv6FdDb7p
         v0ecrE8/guY9/x1wp9PAihU5vmGZrtTvmHEl0pYyCNaQ19daO3VEAUjiugEq7wE2OXYx
         nnpv46dvCdv/t5Febv6AJrocC2Aqtk4sHztURTyjYiHE5bYfkktklpxBzr5XpkeYrECO
         3mnw==
X-Forwarded-Encrypted: i=1; AHgh+Rrbnu/Yys3v2Yadmzrm6bkBhhJ9MlgVB8c+oqdmTGKGStREoan5UA4azSP20XLyTz3IbZJLOZlBzfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYXpyZs/agLn3/ygZU4bR/xz9Xo97ib8ikwjVAzx6oyQX268lg
	L9VoaJh6z1G4pKIPb3fGjry7pTrRbGLr57pSMAeJkEVaMKvqAo4uGukp8Y0oITJpkd5GmPUF6Zb
	NBZjsSw==
X-Gm-Gg: AfdE7clfZ1OaTVviFkH74VBQX47foJYB4phRgXPeZQ2It8ud1A6BrVlspV5kkQkRPZZ
	qlyn0KMGl2iaEefq4WY+UiAyzXRSF/QfbQWpkhn/dq5A2ZpxC9smY/OH07Obk4peuN66gS7CXR3
	V2hJSN6CDz/JqRVEm9UYAYcnCw7ebrEBafH5yaqkA6bXA+8zMUTn9w1dwGrPfxdJRl0bdzk1Nym
	rLkNzJFrRtaHxu02lq4wYEfVsDQZ01WCdYD8FLwiwegiNKBYDxhgHWzhShSHuuv/wajjlVG8sxQ
	XmLtKPxo+OyHSG1yhACYE4BdO6zUCuk6NNEzk44UI9nHe+lmnQZWk9B+1BYrTuh1xgiX4xxf6GZ
	zrKOxQvnX9fFAMWdI59DX+NYJRL9DG9RHbTSWIz9TXRn3NfVLhF8INREtJK2Sz83PkU8cXJkFSK
	dcja3g8P6MreDHlQ==
X-Received: by 2002:a05:6214:4c8b:b0:907:5460:601d with SMTP id 6a1803df08f44-90754606d3dmr11299106d6.3.1784047262989;
        Tue, 14 Jul 2026 09:41:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82e9d5csm172115956d6.41.2026.07.14.09.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:41:02 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:41:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
Message-ID: <b085bbbd-5e40-47ff-97eb-6af9c87c935f@rowland.harvard.edu>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
 <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
 <2026071406-ambiance-rogue-39bb@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071406-ambiance-rogue-39bb@gregkh>

On Tue, Jul 14, 2026 at 07:53:14AM +0200, Greg Kroah-Hartman wrote:
> As for patch 3/3, I'm pretty sure that can't hurt as well.  I'm starting
> to get a lot of "something could happen in an IRQ while a device is
> being removed" bug reports from these tools.  Looks like they all just
> discovered that very rare code path at the same time, something that
> syzbot can't really fuzz for.

The 3/3 patch looked okay to me too, but I wasn't entirely sure because 
it does a bunch of stuff while holding the device_state_lock.  It seemed 
better to let the xHCI people comment on it, because it's in a code path 
that applies only to USB-3 devices.

Alan Stern
