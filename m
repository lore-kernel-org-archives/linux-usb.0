Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853899;
	b=WWxQBJIZAYIJELLKgQlhXzGlySH9VHRhECxXr2YElwoMWQ+Pe6xrUnqvGyx0EWBcGdQL
	 3SRgon1QiEGiQsHyHLuWFiViemDphSOFm2m9Oyr+AzlSUoa4SzNsHnOyQ9DyTlaPb8YQQ
	 itGVHMLrkgf7TnwiK3lG0OAYgLUcSTPBNCjE4tcqUXZT0ZEY2a2oXxnhFI0k7/e+T0PJA
	 i+jGSwv8ZFm6H8UK777IdGUIDIdeohReUFI3aR4o0naUUU6Tw7lzb5TGfNZVOHLlHYBxg
	 FZTY8QD7R/BvnIrpzk3+6S9vw6ZPZVmY5Fa85XVmtIFss9porrm/DXrdlj+M+BF6RIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
	b=VzFaNVcKPt9cKSBNMxv44hL5q0arMioC2RPBgma5D9YMu7CRFKFrQeqEveYBGPswNz/h
	 OSEFeEv9bKky9qsvUMt1jih3wYLaB2RVlOsnrST2VT/qSHuoZkIutHTRIQoCGuyEUFFtV
	 OvsDUJxvsWgm3rr21rW8uLMc7l3gNa64p7qhwmBxp8gn1mM/+Tksan6YIkwwIKTdjBKlr
	 o3iS+pBYu60aJK2T/CaBqN3FnrM9UPR99Hrx6mYU+Uz1SyCOBWc2jb0jEYtTygQdWaFqZ
	 HlSM8GgKxRndvKE2THLi7FcY4wz71Fhvd++bo+hxz6zfPAD53TD+yygxfg63DzqnWXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VYA41JHK;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA9606A330
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBA9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VYA41JHK
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so1145418137.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794853897; x=1795458697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
        b=VYA41JHK1/7uyVYIWyme84bwPY5CiM4AjtFVKvc6/mhR32E9yGr51bV7oUZBtJrMdF
         Zi3TlXmqaos/rleDr5duscLUrFdWoaLCx/o8dBvUCl3rtAuwbpmNjm2azJhP32mekoxt
         w8HJsU0YRR5V1TLIhgR/zwsdyOgDZ3uDu94dlJ7sg7mD8mqNTswNGs5Iky0vHpAs1sZf
         wquduviertQoPKkEVOAndEWLrXdSEfkyTJTAcRUiw/M9L7qCWNuhctDx9zHlqa9EmwOz
         t9cTrLSLaX/UHxSZAHfjXN9BvmwjMWJ5kYSzjdhiesfe3Jy5TptkQNh5NCp4Y4z5LRwO
         ZjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853897; x=1795458697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
        b=UQuNlbxvyP5lqEzvsph9dc1UC0zE27c69FFn8J716u5N6hpMjs5NfRAKfOfg6CfZ43
         imcs2DaF5xD2UE7Su4lYmRVY9560by11CDVU6X4mJsH2UvWJXERpOscOEtS4Rh3oYNgA
         kSpEX/MV3DO2R+VriKAghSGrJdZ7qFyD1W5xAAqn8YVbnc0HYGEtsPuDQFLv29gyiCTv
         C2d+brgvmdI39Nq/Ks/VwPgfjakeh4759BQuGhBt4SK73cISzC9ckHv+QLmzq3vcv6QN
         2p9esxnMhB+B9wA7DV1CoaCXo6+9dL9yTwfUESJoryP1r7fOnLDKKz0mixlL4Zl9QfOD
         ncig==
X-Forwarded-Encrypted: i=1; AL+hErFM9dvXCy6qxkiJMMPTG/5cN77wknXUDfKUSKJ8P14MOyNJwxa6QSfRLLcPpY5BMGa+ukdArR0kka0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tbC+bbvBTG3cTPKZyNU/zvPVCMniFwNKXWg+Erc6qSjpay7Xv
	Ojmh/uwaqunJbWEPZc+clyOfWba4PjRGoEt24J8NWaqIOE/6kSTsNJ/euXoKGv3qJCcBazhvv67
	Zdhad/g==
X-Gm-Gg: AYBFou0INYx2DW6ESVRq98JIc9DGSyp3WPEX2NvnTmRUcm/DgcRcU6YVUcGWNCSRWnj
	YjyxgCnOuxGosvRAWW5A6jGCNzbCBvjG8wJPUI8x2kXc8kh2UIPMUeNO9UL/rn2XO9r47WJKkcq
	kiZEVus2rluBtfYVOXZMWV0wnoPl5shoJKC2k7KTqAssq+yBLlVJXCG4j/fkyGfT3nqzJwckJgN
	iP+7lBfkOf3iT7fcjCTxpqtS4PetPhLpdAtNJx0NwnhCtcNpS7HHzNjTqGmS6AVx0ZwX59zVEO6
	+OPdxJSguxN/L5hF9b/fjlpyf7SOZ7cUWNizbair9yj3idZxchuzPxQGyiseXvD2FZSiYaCrs/6
	Bwsu+RTu/ntOtD+TzT8zDCpOOkD265Cx2GZbXMIvZXb0HkxAdy0s/1y8bkcHMJRW1jDdnxEQKlO
	SgC8OG1hNsb5EA20nhyyoTEcQ/sMwSrV5dqb7qswqxlXegEwOo0WI5KJJirUg6vaeq1Yx+pvnoZ
	YnYKTn3NyGNuWZs2biftuBtPJtiUAkGy+HqJn0WN/iBeBdwEDo6FAFEyr4fxp02Li1SQDp1bMZp
	C2i/jBDIxtS95M2aJiFMlyKMP4bB2nZ2u6TH6GvUlDSlwQnZKbc=
X-Received: by 2002:a05:6102:2c82:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d64d75729emr3525895137.16.1794853897067;
        Mon, 16 Nov 2026 10:31:37 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d702b8sm91768246d6.23.2026.11.16.10.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:31:36 -0800 (PST)
Date: Mon, 16 Nov 2026 13:31:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ehci: skip companion handoff when no companion
 exists
Message-ID: <a222ec80-0865-4624-9c3e-3811a93e8750@rowland.harvard.edu>
References: <20261116063104.1018358-1-william@wkennington.com>
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
In-Reply-To: <20261116063104.1018358-1-william@wkennington.com>

On Mon, Nov 16, 2026 at 06:31:04AM +0000, William A. Kennington III wrote:
> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
> 
> Check during ehci_setup() whether the root hub has an integrated
> transaction translator (ehci_is_TDI()), HCSPARAMS reports zero
> companions (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and
> CONFIG_USB_UHCI_HCD are disabled in Kconfig (such as in
> aspeed_g4_defconfig, aspeed_g5_defconfig, and BMC builds without UHCI
> or OHCI), or a Device Tree companion phandle points to a disabled node.
> Runtime companion binding is intentionally not checked at setup time so
> modular or later-probing companion drivers still receive handoffs.
> 
> When no companion is available, set ehci->no_companion so the handoff
> and companion sysfs paths check a single flag, keeping port ownership
> on EHCI when no companion exists. USB 1.1 full- and low-speed devices
> still cannot enumerate without an integrated TT or companion controller
> and will fail usbcore's normal reset retries instead of triggering a
> PORT_OWNER handoff.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
> Changes in v2:
> - Fold ehci_is_TDI() and its comment into ehci_has_companion() so all
>   handoff and sysfs sites check ehci->no_companion alone (Michal Pecio).
> - Drop Alan Stern's v1 Acked-by due to the refactored check.
> - Link to v1: https://lore.kernel.org/linux-usb/20261114051653.1353346-1-william@wkennington.com/

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
