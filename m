Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661259;
	b=keUWzfl/nIXlm/qNlDtZOWB8ll2TQSoZUYnEp7GWNXcCeH7v2ufWUId8CDJpS/KJng8g
	 Z7wDNDuIj16SVFQMvJSGj0c/W2mDwKwulvOOlRbcEmQVRIUOck90FRCkVnJfPcs5Zeb4e
	 VmyQKBwwixC3J5jQ9gZVQAnDvFuOBMqPVgnexbCaNmCUuilxLaKRlRsU84O3nJEcJZmly
	 Erf0xRiE6hPFUrp7CTWIIG7H79uapED40ZCWkVpTWB/CJUwKuI03YvrfzhKsK9AB+xTDU
	 KJk8NiOOudQuBVnp79cdG1O0sLcWBMjJBC917UVKaiexaxh8Z1AqgFeITGJ/OFmS4eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
	b=IdS5n82M5rQ/v68hJN8CP2o3riDIMDRXGuktiGOmAb6TMDLkMVkMF5dFdJ8GtGbovmMx
	 KpHOFaCJOPEwCOdyAzqcGUKoJcDK9OSnkTm0DcwPc/TIHwMA6Om4FJYqdjAXLG4AaPIWN
	 H8FSA3W6zhR3PTDxaQ0zP4zS2roq+TWoQduI2FaKaeQNZEn537XD6qf1OsGhiDEIqv15+
	 03z3KjRyz8IkNZMDJllTtcXGT82/Nv44+ymgH4lDSWAVpqeaRSp3U1WMI95lirG/pD+Bc
	 nl8O6D4dIofjKAB9O0ffNdHHHakaAF93OwxFY90NDkXTEjuqqkFCY+UfKTTqiu0x03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3jtUgYm;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEE606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 13:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3jtUgYm
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so2568715a12.2
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794661257; x=1795266057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
        b=T3jtUgYmzy9TE1gZDpvFRcansJmQ3vzKtwK60d8QPgQ5SWlX/aZeq27BC0DqI/TFfx
         uFUDFSX3yTC+p8x6+pivJVKB+D+ZYxl4DMzMAWD47F4cdg2NAPbNmPKBRhaplPFMHrul
         2ASkV7EMO6bMX9UWnF79ytpE6Bi6Qj+MBNuJ5pJbEK6COmFQ4wXRT50PU3azcWeBcMQy
         FXCKnwj773SUT2JeulyTkJtKyhOwR5cQE9R4RyYU2E7A9bYRlzAxZzb1Xioap1FM+60N
         kSWhEj38z1vs56jzff5a/4oyS58Jt9eU1mdXZxy+26vbcqFu0IPXbCrCfz8D6OP0ntbw
         3f8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794661257; x=1795266057;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
        b=pYgjEp0cE0a9vkTDjqVsLYqjlJOPORFvIsV508M3Hfb+WhmweEn5l/t5UyJned1UvE
         NuE/GoJn1TEDcrTkkLCJxSndvbmcHeiHxSjY70xCXIHvHiWf8Eld9bnzwaH/vZxuzLtD
         wmIDPflZ8StyOG28EJa9epRj2M40DzgJU92WEt6p4mkw/trT8Tgfjvx+DUKccPIOfcWp
         mu40v2wabTOriJjFVfqDrx5IikYqWKVYYMeoO2PEzbjfYP/RJSUCtFOaAbR99M7ifCsV
         hPVyxkOb7KpQgbeeweu6BiF63cc16W9fmqozv16rSc2xK6A23zeHhG1YCOvvimNMq8xC
         9fIg==
X-Forwarded-Encrypted: i=1; AL+hErHU1Pb0i0G/nkusMq1ifYGdAN9Jt1LrxxbAm/rbWi2mkwMeiImQwdXw8bAQv1j9nLJhDokH7rhSVNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/11dr/hcsZfjyaLYVNP+e7SSpiwkPuKa1z3+deamoFEILWkS+O
	3ThujS9aDafcyJSgvcHR5bqok5YNGfrnThA0XqxKFbpGe68187HrnwMT
X-Gm-Gg: AYBFou2uaGPhB+I0qEj+4nNCkOHaACxVJqN4xwZ/KRFNbIlV6AG9lQ0YVfCz059ZmUZ
	pDnTl8qjmI6XfDONyeTTIWID7VndpPMwERNa6y83gs/YPd0OMSFf77+eVrJTaNGIhCzLbelW2Ke
	G4wke7THBSeiwANoq7CjeRuYSkN1fCWvpSHRdgMj6jHEZtsQi0K87ys+0LS0Vb2TvClS6BESEk/
	XnNTxVO5B/4AbAtolOLRTV7WFrbKyljTi2uz09jkN0dNuLXpxpFQb3wOV3xWNAo7bomELB0XIfV
	IPs5SWe8aJIYCjx4RogFF1++621+395XdxywsxJPJQkmtYAOw6ZjopjWcfe6zkzO2BlJtDl3BDw
	0Noae9gTjd05oi3t+oNB1R37DxZkkXrXA9sd55LmiojP7+sUMIOr+iViiS4wk3EYbd5T9L0wVFA
	Bc728SriE4VVyPD21vnrjR/J1rgPmDOcDfDsQ6J6ZJuN+lEBWKFZPquGcr0e8WoHkDlW2NC0MKW
	Lyq2pGguMJ6w9mEqdoO3eOca66DFPKPMV2tvgHJWa2l+EqJd1xqqyvr7FLb2OoaPMWP3RkDFf70
	BCYPKp7o7rAZZTlgZshUmzcJ6FmUjtYwBlqlpLwP2R2um8nscTp+x/NZOSfXS5X35rV6FfueIb4
	f5tkuu0mOiqPJG0JVyfgv2A==
X-Received: by 2002:a05:6402:1598:b0:6b6:f7cf:8088 with SMTP id 4fb4d7f45d1cf-6b7c0c6f6f1mr4621363a12.32.1794661257359;
        Sat, 14 Nov 2026 05:00:57 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde80sm2383864a12.25.2026.11.14.05.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:00:56 -0800 (PST)
Date: Sat, 14 Nov 2026 14:00:53 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261114140053.0ad11276@nixos-macbook>
In-Reply-To: <3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
References: <20261112122825.7730-1-sn125164@gmail.com>
	<3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 13:39:17 +0100
Sven Peter <sven@kernel.org> wrote:
 
> Nah, making suspend/resume work isn't the job of the type-c
> controller.

Thanks. Would you rather have this handled in dwc3-apple
(dev_pm_ops doing exit/init on resume) with atcphy remembering the last
mux state and restoring it in its own resume callback, or do you already
have suspend/resume work for these drivers that I should wait for/test?
Happy to test on j314s either way.
