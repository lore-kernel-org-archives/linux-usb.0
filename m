Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001795;
	b=WlAbhYlFMnVq6BHTX8+E1a/5DmrToBDMf2RV5lj2zwvfOz6tIinVdVECz00K5sV6Gnqd
	 6ePPY2UVoTZfmpHojPIPgu8QSHp+pGEeWNgf1W4pmiQ87F9s0zP7wkZru5pJAO+SDlAob
	 EJ3q795Wp1FgXzD7shl4Eelfxc8YlCP1wwrzwPENLacb99eFzf8zFdzbuDMHgpnIzit0i
	 7vBA1It9euqYy5kfIha+U3ZNd9mbLVzcagb0kPoqWNukPwcr5ZQYnxD2/dxDEtD81uih+
	 DuI4uoQu9nZtB4f38fdDTjWt2O+vrHh4zNpHXC7okFBMV4Z0n9dvKamlcHL13AxUVmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
	b=sPXZoKB1dbxmWomSaXs6TQdZzJIs6VGn/e7dhN5J/0/HENdd9boWTLSO8SVIN7esw2Gt
	 reF9M7452ib2ky7eHVSbhuws18iPcWzv4e2vi6Kc+Ztz2CxNIiunl1mv/MRbQzFiPFnVW
	 4ihrhd2yvmPRwgIoYbQTc+Plh052nrZEHQKhxoKaozjcLdRDoUp+Ryx84Tx4qFZd/jxCw
	 rK/Gu7eZvEJq51eH6SaOHo83NZllRVVJ5m+g+kkFq5Ov2okeKvSE+V+i5881fxrHEM9j6
	 g+aYGmp7tFmeJmyD6tc4POweIVwG2jd9kXts4Q4NZzgT7xENv71sjib8k/8AGtdrdYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0yvDTMd;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFAC606A320
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 11:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0yvDTMd
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso407243a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001795; x=1795606595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=f0yvDTMdH6CmYF5yLvtKtTMohE6GLZES7exj5T1NWg17Jyc/YlN1EAJEalUzRXOER7
         /zF/f95S16DpfT6X9bFh7Vo8U6Fos8557o1LuFdpigMsLw2mLX2nIQ5CB5355pXguMVx
         UtcjxU32tLtJB4uTKnTRYh0fFPzFRh2I4oDoFCK+QJHf/YdJE9yvz+WIcKkmzZ9DEY9w
         qwAuGc4tjfcOKbYsWJ2pdGAFGEyqunyryV5sQGVPh06ldLGn4SKHBXIg3chQNn0Pcg9A
         fIV3CtmbMioM87y7nqoxTXV+A5I+TCEV5CBrNWL55gSwlJxZG6V2hmYFyRRgxkM487RK
         R/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001795; x=1795606595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=GBKp8QiEqQ+Ss02c6/8qKOLzd7iLBMexCEqTPCVo7RjAZy17xoKTlFEl/Z/PiUo3sE
         pGO5NIlbnf7wwY5pKt5yISQL+v+brY78PbEUiNdQXFR6mvOz5brovXc47dA3md3v9dAg
         Z3o3W5LhylZLdF6hJG1Y3Qju0b33LnsaJ4hBcA+WqHIeUOW4YDghcCjPXJa9yEPecoLN
         neoMa250isqWSxg6dBVg6Ab8Z5OA6gaOEgdCk8cR7BNi/on+gkRSSsx5au93GPcrd9Eh
         bDnoAVnZNqBO4HPPuUpVZ4XZ5hYFRHaquc0q8fLgNssNGfQIB9d5IWh8AZq1Wd00zuk8
         k1qQ==
X-Forwarded-Encrypted: i=1; AL+hErEOVjey+EBBbiWvAQIk2nXlJC78xjpEiZMEKeHy1kKbL1pzr419KH/cA6l/GUqOFpUATYNnLGDS7Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z94L5GVS+3mQEv4sqwBoWCbO8mJJrIsPPo68rQPqYP2n+TwyXQH
	WlgeRcWeiMMB0iUFkCD08u+g6qCF4ak3jetZ1jTMmSW6AqREdgyuWb0D
X-Gm-Gg: AZFdTZepHq1uqqs+wYPMnmsN4xNVqVYkhpBNCXkuenI8IjfMJX5wwveRfKXioenc+d3
	jj23FogmM7vO9bVXDVRaJ8YkIKGFkDaJb+7hDunYgvWGM0kv7g81/UH9HcfzBa1UnXXeI9GJV0N
	2uNrWTGBnj0AwP1AiBeAyhHLcdDB8cHeIo/Hho/VpmWah5A8lMB84qJb+SuHE+VXmucS+2XJ0tr
	/9IoTQISPZtGLFEjFh7Ea3Et+vpgfPMrwnjT1IdgXMq0Yf1Fh0i2fH0+RlDIX7ijO6m5xMOdVCX
	NRkeLfT2Gjo0NEWJpvSaU/ebIYhAM0kR90HB7J3KxWnLSnw/J4f30IJKJehydbZjBAskOtyIBv3
	EFW/eiaSHTK5jd15TmcAjP8BZH0uhYJ2Qi76eJ4wMPnW7PPaJ1aQE5JIm2nlwuWqT32hT/Ksq77
	brTPBejpa1j8rMqzOQ5jwb6mAsrOzUbSdxi+vcOvFmcCOj4fQ6upQWZzpc7SsqXFX55H7Sjw3Nf
	Yi1cNu1v75NHpE2om9smZcgLq+s1RFeNKyHljPbdy6mSTujOYMTL5c7sONVNWueQkMP7HFNVxAL
	nnjFMFSCID1AoNESFXvbkz3ORa4=
X-Received: by 2002:a17:90b:4488:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b3d0761702mr2554146a91.29.1795001794613;
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8944570a91.4.2026.11.18.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Date: Wed, 18 Nov 2026 19:36:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hminas@synopsys.com, gregkh@linuxfoundation.org, 
	looong.bin@gmail.com, dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Message-ID: <av2M-6w1u5mOyqDM@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261113072305.220610-1-chenyou910331@gmail.com>
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
In-Reply-To: <20261113072305.220610-1-chenyou910331@gmail.com>

On Fri, Nov 13, 2026 at 03:23:05PM +0800, Chen-Yu Yeh wrote:
> On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> > The current DRD implementation of DRD will cause a interrupt flow on
> > CV1800 Series SoC. It has two reasons:
> > 1. The DRD does not sync the phy mode when change the controller mode,
> >    it is a violation of the DRD as it does not rely on a OTG phy.
> > 2. The CV1800 is entered with a Session End Detected interrupt, but the
> >    DRD code has no change on it, so the controller will enter the
> >    interrupt storm.
> 
> Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
> series [1].
> 
> I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
> f66469d9905b, with this on the board DTS:
> 
>   &usb {
>   	dr_mode = "otg";
>   	usb-role-switch;
>   	role-switch-default-mode = "peripheral";
>   	status = "okay";
>   };
> 
> R=/sys/class/usb_role/4340000.usb-role-switch below.
> 
> Bare board on a PC, after booting:
> 
>   # echo device > $R/role
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
>   # echo host > $R/role
>   # devmem 0x04340000 32    (GOTGCTL)
>   0x002C00FC
>   # devmem 0x04340004 32    (GOTGINT)
>   0x00000000
> 
> The interrupt count did not move over one second in host mode, so no
> storm. Switching back to device gave "configured" again, and "none"
> went back to device. I did one host/device round on each of two boots.
> 
> On the USB & Ethernet IO board, with a USB stick plugged in:
> 
>   # echo host > $R/role
>   [  136.556790] hub 1-1:1.0: 4 ports detected
>   [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [  139.174764]  sda: sda1 sda2 sda3 sda4
> 
>   GINTMSK 0xF300081E, HPRT0 0x00001005
> 
> Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
> 
> > Note: This patches set does not resolve all the problems, as
> >       usb_add_hcd() will override the role set by dwc2, but I am not
> >       sure whether it should change skip_phy_initialization of hcd.
> >       So I kept it as it is and users still needs to set the role
> >       in the userspace as "role-switch-default-mode" in devicetree
> >       takes no effect.
> 
> I see the same at boot, and the "set mode" print in the PHY driver
> shows the order:
> 
>   [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
>   [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
>   [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1
> 
> That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
> supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
> host (0x03000048 = 0x142) while the controller is still in device mode
> (GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
> and the PC sees nothing. On the IO board the hub does not show up
> either. So until a role is written, the port does not work in either
> mode. This was the same on all three boots.
> 
> I am happy to test the next versions on the Duo 256M, in both device
> and host mode, and send a Tested-by.
> 

If there are no other bug in this patch. There should be no new
version. The device probe problem is not a very big one. And I have
no idea about these thing. Since my time is tight, you are free to
send the fix for the device mode.

> Once your series is merged, would you like me to send the DTS change
> for the Duo 256M, or would you prefer to do it yourself?
> 
> [1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/
> 
> Regards,
> Chen-Yu

It depends, if you accept setting this to host, I can add them
at once. (Note: once set, no change will be accepted).

Regards,
Inochi
