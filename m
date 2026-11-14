Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794685464;
	b=5HNw4fLd6QQ7He11XzMobl1KU7JjQM38Yc4BPK7sUcQm/6Zl3jEVrpk1cEzSS74Ar04p
	 b4uJIO67A1Xr7sdnIwwaNGUVSfwhI65B+NDrnGDj97Nzm34rLucBYqQmb9Mgg4v4NCPbJ
	 QGe5c7mG0pJ/K1lo9wesXunpJPVrMg93+2EnFYeoxyIl02vAYEQDPG5uZe8uNyeGkR/IT
	 AF6eM+P1E/AdfFvwlFZtuFrVa1XGg4lPZxuCDnRreOSnXo+eb0DZCS4EEEbIj6DSsLXqE
	 BC/Xuuv6hiI0fZWFIvlbzMKP7T7LQSKA5C79tLwnPCSRCKo6dG3neX21J5M3JnDuxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794685464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
	b=3Bak9bhqU85rhBaYB3HyRN50du8KKLQAt+8F0qSAdXNyoSMYeQ4Z7Rocijgwkcl0OAyH
	 ax9uwBXJFPBjdSVw9s42zRgwQPb+/J+hYuU4wdqL/NZ+x7XWr3CZLLaA1BD/jKRBwAb6l
	 pbBteAB/Sa/m4kJstkEaLJLsMUcw9gOY3kZrEjkUEO7dUDvE9jryO1DT3lfZc5rElU0gC
	 zrZKn7epBrkbWxxjUtzZtp7KEApXOc16qSMsXNP9ydXwYhb/QiVPBQbJWgRqWbAgFuWKL
	 r4XUhFKRQaAvahxay3kuPpX+pQNHCDjdFUozSRKkP5gkujGshCIs04M+Chhw2TKZTYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZEfGR0GQ;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC18606A32E
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC18606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZEfGR0GQ
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55b8cd4e2abso21747791cf.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794685462; x=1795290262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
        b=ZEfGR0GQRiPFSZ3orAqAuDTwVesgu70z9ulUL6L3SgMWFagTm3h3qizvETjDO8yNRt
         SWjlr3SV4PRTHfX744xltDpOv90BidUSkZmsmUk0QDDsRYfTtVEuRXUH1cdI/BdY2RPV
         iavgZsVQauWzy8qS9RNWOOTbUd5MeMMOCm5beRHbyXplae5Y3yTziLW7a7FrPwj8jBWQ
         teuLOzccbTB2TbXQY9Nc/FjuJXn8bQ0bzAgnePpbg/DDp7499/4lQ9gLoHR+Ndzxb0yJ
         kmsObY1QGoLH0+ulLETu7VkEFNIEDGT2gnYVK5dz0tyxlWHoozV+wzXdZ3FS1YM1P0VR
         504Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685462; x=1795290262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9VL5KrwzPhSg0iJg4Cv/rdFJ/18NEQqKiVSmX7CbcY=;
        b=uopd78oi0yJjfUCaL9TmFr0/3bazuz4D0hph2RM7xqDSIE2GpTIHTQI1AqKgCFk717
         GxFXBhzlMuUHnzk4tvDIoFJl1VyntADoOcGrbdEa81rMFI580loQzFFIZDq9kQYuThpV
         bWERsWfQiLAeEiXpxNKHBfQlHIr34xevNzy2p01SlCrSRBH2MiBpeQChglV/1iZ4Uk3D
         6i+KErs9BojrVyukHo7ahq2priVWMqLzUi1cqv/XwP151M7TGoVQL2y1fSS6pZA58EY+
         FDqm9oR0IJakzlxGbmtJ2yhbSl436ZwTzk+42fRARdkodyfdV5O3Q9CtcoeIk6f6Vi15
         rGDw==
X-Forwarded-Encrypted: i=1; AL+hErF7OJ7Aj3LDJrDNBnXJ1S8vO48O3H1KwzaiIbqSD9bryaNl0Y9fIK90n2LWbOUgXeuIcuiHdDh7Tek=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wt3oPojTtQmvO0Uo+Yj1zLOhdPTjyZQGsPhBgcoRvr1sw9iJv
	BMWoiqul4dkA2T0f/YaBXFDJNfm5RqQsMIG5cas890wF5DbJ4Nj5qFfOJtIJ5yI31w==
X-Gm-Gg: AYBFou0TaWEErmbEX4jLVhSfBH4/2KKHWyIrhst8e+WESSlx8PUTEoNbvtORFdwM0Do
	ntw3mhBBaiTQH+F+4XGoK8eTYx7Ro05Z+q/Nrrm9xN4JM2yFw0WupDWhTgi+fCc08rWk/qUW7ir
	qJ/Vnz2EpB3Z7O6j5wBCaMw54D3z+mOXsaVwIQzTXViRcFcxX48ktQQcgbAAcFL1gUH1vl2hzRw
	Xna/fSw852bMdhZaVeco6E12RMP7AGwkOGUA3ZQYLBBDJICdLKQ0GrF93fWVdcaIdpUL2O9TLOz
	2PwFLTK6Ezg+SyUy8xGGxy6nm1M9c8gfbiex4CN609WWEHcdM+zZO0ZTrP/DoplCrSxOJNGQ7BI
	wyP8gZIUvPsm8DaAaaFoNSdrjqK65l16sj6XvKQmsobD7pBBbYzF0V8CJl7y+HSBKsZ6axRFDUb
	/zkezhDqH/OyLeYWsXIirmlbyDZxhG7MW63M118xuq/wgS1QQGMkizTMBRYNH6VQXs4D8OqszSa
	bZFy0SEAdEy3cGsBnm+uAk7h9IxFfnqWme/QKdJU8a8++6trv0yM9LqY5MbCFUke+lV+5rkGvu/
	j8vdNqUQ01YlqXT21NQIqmVkTVU5ND6efGImGHO6b2Ib34wCD9c=
X-Received: by 2002:ac8:5749:0:b0:535:232f:ca25 with SMTP id d75a77b69052e-55ac42874e7mr99366071cf.7.1794685461645;
        Sat, 14 Nov 2026 11:44:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm49412876d6.25.2026.11.14.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:44:21 -0800 (PST)
Date: Sat, 14 Nov 2026 14:44:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion
 exists
Message-ID: <d6afff30-2183-4269-8cfc-7992cfe5c884@rowland.harvard.edu>
References: <20261114051653.1353346-1-william@wkennington.com>
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
In-Reply-To: <20261114051653.1353346-1-william@wkennington.com>

On Sat, Nov 14, 2026 at 05:16:53AM +0000, William A. Kennington III wrote:
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
> Check during ehci_setup() whether HCSPARAMS reports zero companions
> (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and CONFIG_USB_UHCI_HCD are
> disabled in Kconfig (such as in aspeed_g4_defconfig,
> aspeed_g5_defconfig, and BMC builds without UHCI or OHCI), or a Device
> Tree companion phandle points to a disabled node. Runtime companion
> binding is intentionally not checked at setup time so modular or
> later-probing companion drivers still receive handoffs.
> 
> When no companion is available, set ehci->no_companion to skip
> PORT_OWNER handoffs and omit the companion sysfs attribute, matching
> the integrated-TT path so usbcore keeps port ownership on EHCI. USB 1.1
> full- and low-speed devices still cannot enumerate without an
> integrated TT or companion controller and will fail usbcore's normal
> reset retries instead of triggering a PORT_OWNER handoff.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
