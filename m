Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7F343889
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150853; cv=none; b=qgitmpQmQNDwztw76LRF81fFmnKLLLaRdrQtKKK958srLnKJwKDYm8LGSk/xOTsdWRTczH9x6degEpb42hrhWrBHqPXNYOvoK2n3BMshK+uXRHP9mNTuBEmoXfb2S6+Hd0wYfVeebHJMqGOFLWpe8yLtXYEZ3UUEOu9VCzAIaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150853; c=relaxed/simple;
	bh=gi7sL3KY2sz6QA9RwzBfaKxGTtG3BGziQJpEdWzH7tw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c3n2RZilYcYvY2jfgJLTNPZKjhUmzIH4pRoFmWjGViJXFGp1ZsaQVv4ovup2tNi5SqWir6wBjyKKaGHgMkfkDZpoWEZ+2HzCVrGy6P7OxM6uC2q0zOSUhYSRUYCWcBkIgVDsyNgRF7LTNS/ji/CkTJQHwP0KfELDFE+zdq2oCos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrM+A7Tj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrM+A7Tj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1092124f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150850; x=1789755650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0qADRog6x++il57lr7EA6g1h38VeLT7OTwOYzw7rU8=;
        b=KrM+A7TjH6qHm28bKUE8qd/lK5SB7icssaeOmGFNcPhtN+P6XKyGO1GdYmt8pAOaAa
         KGfcJE7uMzLITXVttQKOkUgNKmjNeQepULR3h0AGfQFa7eHxhRwzrUQKI9kD9Mec5V4H
         RZZFMofVzvkgATkRfbhgBQg0JvBWvF4rSfyU3eSeTPNbgSyNRGgf+aLi0v+JRM17IjWh
         d7yUOj/CrZMZ0vK+g0nFivmYKHn1jkPLU3BASECqVAwryJ9SA1FeWrz64F8V6RVuIGo1
         ta4mH7xPh15vrc9qHzqiQHFg+jlNaaEYNkf0pAZLHE9C9d1TNRwJfAmsd6YTxQJNC+oU
         2NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150850; x=1789755650;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0qADRog6x++il57lr7EA6g1h38VeLT7OTwOYzw7rU8=;
        b=qMl7CocKOT0Wv1AINHW1jyMdW5BNHBI3aqba+T6gw8hn/YvaT98J5YVP6EIKX0JjDe
         X0W0H7K6Ek54y4ZUZZ4uui45uA+BJPlAV+dULOoXphKVEXsd409BnL5VGAUpdcILP9ZL
         TRGbgWicIImmQw7vCDg0FjzTqu+qcmuGaw3z9PyPraYbkP/Rbwf+EUCke3dAO0jYWpBA
         8bK7pIRmV4gYn0OWyLxsqypiVcTdF7+/EWQL8l05mkTYjL3tTg/eOa2vDxfoq+lgacjR
         WApQZoTrEzk9IPKnYVE+E+3o22UIVLqpf9W3WrIBphLtd9ogo3iSu8iUM/+1uSusK7R5
         c39g==
X-Forwarded-Encrypted: i=1; AKwUvBxHZ1ryy08cFTm6WABVXtUBabp3uaYYFtDBodGaVDvsrtcLfI6KXKE0uMSvMqyVjiYB4FpAuaf6sqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mXfjhVU9Xx20KgYNCC5Mb9jtTwCJ0zun18UaIdpJvT0reM1QlX
	rC4hLLcnDVTeNWG+v+wAnOgzzeQP480jcWw6VXfn+OlKcuWt8N2b9JIC
X-Gm-Gg: AYBFou0+lpESycGKObhIuDaKNUf29G0tkKA0mbZ6OaDPDvtZd8wF6mLYC/XQ7RysPcT
	ULj3cLwWZopr8cxVxxKL+aDOpFicta8q0umun7sZXIkjQwGqBuq2MwH9NYsMcgS76qgd6BuJx9S
	4VWwJ9q7oBRy++HRrmKwHQumSPJa6ObZ1xmAQEHUdjOG4ftV1Ps3HX/A+csdjO/fGvav2vP+CDR
	tiUoQhawelaLek28sutmyYxSqYNK3g0ubLohfK5dTOnHpr9HmC7OCJuQ6yqxvzanPeFiFFczHQB
	7L2HIE0npAoHNA5JWW8athy07PL2SHZQQdLNDNOisRE2MFbSWAgMbrLe+MRjbQPvS+G/mtmc9Oy
	uG5i+ay53HkkO+LVoG4SlYxWOSJwDZDd9Ss5pPbDwjmce91p924K3MoVDmggZcPfxr2DfdnE3Dw
	crZU43/NPXHbTlO6Wlh1ya6ysu2SEZ+oEUvt8fQB1RnlHgHlOrwy/lSKcKfQDNVK9t3pspJchyJ
	gZdxjlL
X-Received: by 2002:a05:6000:2f86:b0:486:e73e:abe5 with SMTP id ffacd0b85a97d-486eb2e269amr7641832f8f.10.1789150849834;
        Fri, 11 Sep 2026 11:20:49 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm8116975f8f.13.2026.09.11.11.20.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 11:20:49 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:20:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Pierre-Loup
 Griffais <pgriffais@valvesoftware.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:HID CORE LAYER"
 <linux-input@vger.kernel.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, Curtis Vogt <curtis.vogt@gmail.com>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <20260911202046.5c28864b.michal.pecio@gmail.com>
In-Reply-To: <2d4b2c51-ac5f-4fbc-82aa-8d573d095687@amd.com>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
	<20260910170254.833871-3-mario.limonciello@amd.com>
	<2026091133-silliness-recollect-e190@gregkh>
	<20260911111652.703b865f.michal.pecio@gmail.com>
	<2026091106-footing-antelope-7ceb@gregkh>
	<2d4b2c51-ac5f-4fbc-82aa-8d573d095687@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 10:12:34 -0500, Mario Limonciello wrote:
> On 9/11/26 04:23, Greg Kroah-Hartman wrote:
> > On Fri, Sep 11, 2026 at 11:16:52AM +0200, Michal Pecio wrote:  
> >> On Fri, 11 Sep 2026 07:54:12 +0200, Greg Kroah-Hartman wrote:
> > You are creating an "odd" user/kernel api that is used for
> > debugging, that's not what sysfs is for.  sysfs is to show
> > attributes that a device has NOT to cause the device to go off and
> > do some random thing (yes, there are exceptions, but generally
> > that's the rule.)
> > 
> > debugfs is "do whatever you want", so that's a better place for
> > this.
> > 
> > thanks,
> > 
> > greg k-h  
> 
> I suppose an alternative path we can build to all of this reset
> handling at power state transitions and sysfs/debugfs is a callback
> system for a failed EDID read.
> 
> Something like DRM drivers can send a notify to a global queue when
> an EDID read failed.  Other drivers could subscribe to that notify
> and react.  I guess this would only work if the USB reset sequence to
> the HMD looks like an HPD event to DRM though.
> 
> Also it wouldn't be perfect.  If the HMD was connected and the read 
> failed on an unrelated monitor on the system the HMD would reset
> needlessly.
> 
> Eh, I think I'm talking myself back into this approach the patch does 
> now.  I have no qualms moving the on demand knob to debugfs.

Perhaps one more option is to put this in userspace, with some libusb
or HIDRAW hacking. And if it could be scripted to run on shutdown, no
kernel driver even required at all.

Regards,
Michal
