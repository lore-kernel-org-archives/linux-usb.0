Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435985;
	b=SQnNV+73DTFWuCru2Ldx8Nd16b1M5eOmc6gDn7GpNP4Xah7P5VecuK78e/9DHeIbZ3hk
	 L1Eg9gFLgMt6A//6yiw7o6pMPXzRm2Vtun3XSyyR9OUaqvbYfW1KAEnhsdhL9lkdTcdEl
	 OdIyVo6Y+ldmaQyCLNzEe8Y/lrukno/jcnQQjQfSGWnyONp93jR8O9oiwH6lkscC9WAkp
	 4Ym1of9TPw1fUrCWyYWcQk1anqbCPXHMl+KqodgBxMT54+g2cGQJbl1wHQJm2gEuVFFIL
	 biIEcVIUMekmEuVzPHKMBouWlTu/uhlvVRNRU9TdIVrNm840d6sJLjrobEeUDaZLD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
	b=p9VTXgJdpgG6R9Hmt65oH3XSrqdzkaCGFYP35JN164Ur37MixZTwmZ/9Us6Uilr0pAE5
	 TR3kDvj6GlDU8CQD7FagEXgv5Wt+zYkmsVS6w01PWxJS/PN9bpVbyGdOKP0cApI+wofP4
	 ZKjMbjSuLlO+lwxaSDgq3/ZLP8qB5j9Uy1mJHyinV/R9ZTsySl76YtDAfyhjik8De782S
	 HMVg+FQmEYT0UaPIDip9yzsIJ/fp0vALQo9RGrdKWVZiH4JXnvNVqbmrLEg7Ghv0xXXWr
	 kAV6Efbs8+oT8KDoZu/sc+rkY4R4W8pvLRfcz5KUZ+of1aqP78QzSn9oCxl36/AiDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F742606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F742606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04e3bf46dso21444955ad.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795435975; x=1796040775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=WTRBxD68mxmBMUDeAcOF2tKZEqSYLCNUPKR85w6u7MFXIi2cEY8cj7JgvwVfUVamf3
         P3Pzqoy8IB5bJg5Jvw1kPnvb0djMTIY/9w0jM5vY8oNuUqKdI3XLEYS4gpwgxNBfynhg
         s6mqbd87klkVJZHdWFt+1ocI8nSEQWDirNwAIo63O0wD6JTmO06YpbWx5miMMvVj0ZtG
         9O7l4vC0eza5ltf6pB7NAQUiisSQ/gpbfSqbv5jhENm7GSI2lP7+ZygOgxOdLIzN8evb
         GQAzNieO5N6KyvouZSRIDKMLvt//iHVrhPhfu2Szrgk4pGaHElaecKWP9dD0HMS40oKB
         Vd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435975; x=1796040775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=1hCOG1joqa6yImlqSwiX48AO6V6sM+IUcfmFA/+NptTRbdokwcPGL9YOdpej3j8qc0
         5yRjSh/oh+O8vOyaP36MKUll3HODQtkGHs6aEm5FEWA6gVnsPxw+d+XaRxyyqwSwOtPH
         QhmqVCm7SlerW3HFfO5Vud1UZnjB05KzqjnjiFKGqLLCBlBIEastOIHgrcC+4R47Jj0H
         Wojb7twS+n/EIAWOtvIh7tSD9WPvM6CzrwlHVLMJzutvMky5XdX7NtpgL2FbrmpZLWqs
         WALbQB8lmVC8M6f55luEOnanCropJgIAZXDKzfBssbMK6tfjPyTPr3Kp9MVcfmPs6ROM
         +yTA==
X-Forwarded-Encrypted: i=1; AL+hErHEMCb8HVhp4ROnN7nl5hWDAPmM+v424JRF51pvC0vqGRjzVD0XVqHR64jJiXEtVXe67TCiDmyw7g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GhZNAnBocjNadIXclNLzjFJDl6IlzkwJXJfnfwqxdhPNWlcAA
	jPmQC+RMEBY2xPcCey2gQIZnFuMk2gSG06X9W5WSUpx6ViUiNOGwfhUvIaUb+TV01A==
X-Gm-Gg: AZFdTZdWTZvk3/7QRLBrW+ID67HRsG55J2fks8tvbRktfwzhAOwAk0w6WzC1QPv/V87
	FpKmR1bgRG2vmfYTINpbyjjH7k5uvANksuu99hN/Ju9KCUaAHLfLJUSGw0qzbmEIhLzX1oIVuOG
	VgUnRslpZm6MZyLtmmT0t3yMz9oI1+oo/ruSn4V6u3doS2TJ7xqZW2c6B67rWwx65J/0IGwi5vV
	WjAttAgXIpd4lONiFPBkB5F7r++e1qzbUKudj5zCJbZZsOGcSDKbENqI20Lt0YzojHUjhFpEcZZ
	ry4lOoF/FxE7aaM/ZFUW3r3Ozyi3O+jCWUHjRJBd/Y1JVEJROhu2x0J1SPSXtIB1eXxHFJ+nK4K
	SYXtj6YRyTUOq4y2w9StWucwOdXMn8KFh9ZrgXSDZ8JaK3gAj/+Nx0uGgsgMrJr1XZIGGY6ryBK
	s1WfcNbpPd53jBY8+TdUadomzVPbUryYfv/YFK/LTTezt8+Jx7wFTsNMIFlJttkeEXs+gDkFZJo
	FvPYcMg7Vn73ts6a5/Iub2pvUtKhXVCRLgPsef7foMEOy6M+QyuozlI09sRK0wCU++4tvspZyB2
	GbLDTVvS3LoFG0NWQXnAh1Bsu2gfH/YKAlEGoqNhjFbqMBcESxWZ+0ZjO05hQP283SbMkp9nw/B
	9vxLH/hsSxB8Qv64hRA==
X-Received: by 2002:a17:903:1ce:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2f03f1ea636mr110975425ad.25.1795435974723;
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm12731675ad.37.2026.11.23.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Mon, 23 Nov 2026 19:12:49 +0700
Message-ID: <20261123121249.43867-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
References: <cover.1793669297.git.jjc@jclark.com> <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 12:37:43PM +0100, Thorsten Leemhuis wrote:
> James, Alan, what happened to this? Looks like it feel through the
> cracks after Alan's "This is all starting to sound very complicated and
> fragile.  Isn't there any way to simplify it?" later in the thread,
> which was more than two weeks ago. Or was this regression fixed and I
> just missed it?

It's not fixed yet. After Alan's comment I dropped the pre_probe
approach. v4 instead had onboard_usb_dev call the generic driver's
operations itself, so that it can defer before the hub is configured
(Johan's first suggestion). Alan acked the USB core patch. v5 is the
current version, sent on 2026-11-07:

https://lore.kernel.org/all/cover.1794018128.git.jjc@jclark.com/

My understanding is that patch 2 is waiting for a review from Matthias,
as onboard_usb_dev maintainer.

> Side note: another regression bisected to the above mentioned culprit
> was reported recently:
>
> gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
> https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/
>
> Doesn't look related from a quick look, but well, at the same time I
> wonder if there is some subtle connection.

I don't think they're related.

James
