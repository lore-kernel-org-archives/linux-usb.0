Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8C47DD66
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 23:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304453; cv=none; b=LEwiOCwRsenTre1Yn+kAy95WzAGv9ZQUnQcHvuLvezkeoncD90fx+xgaBXWrbAYzlGRzu76VhiCxL40Cn+jA7g4jSXEbjldntparCwNNR2C8AGsFdkfvp8zlv4FzvLYgmzSjLENl77PAvzrEAfA7cKwnz6IOjA3aqtPCDINHPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304453; c=relaxed/simple;
	bh=sb1EB9OPqMxvqg4maeglFfUB5ALDGwfGjDKTBjQn1HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc9o4gDjRs4/HmkIUn1NEQrpo9WPSuaLcrFKFwPnVUEfcmouKdCA1ZJk2a+dI1M4nUj2FrhtHQQWkchoRt0KlVcH4KD6QbLFoQAY2JhcX+MlljljtM6YssC8D98IDD4mzAfm2jVwO9H6uoMJwhxEUzk4cKBspTsVBpKYEnVrICM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch; spf=pass smtp.mailfrom=oes.ch; dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b=QWRcVmF4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oes.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b="QWRcVmF4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso397970b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 16:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oes.ch; s=google; t=1788304451; x=1788909251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujwtlEIxiB2YqKfbt6ZY/6X8zexWLJIuFtx8gmHU1I4=;
        b=QWRcVmF4rx0T1IsJV+ZvHQBePh8nxrlXUQW5u/nxedZBqVOAFPRlhdmjcOR2D/lJ+i
         nE9MfRE74rW7d333ttoainXUHKDvefJn4T6FTDmqat57cmlrdq+fvBtiJnJwQpfrZyXB
         ieI3E45P/1o3xEQC9s7yIi3bH1CA+IDaNnNQusGDctGz6y/M06Dt0yvnAbq/3HvZoKJ5
         OmWz3d5+J8JFzrnwEo4Hh8DKYaWgd3v+7kA/jEnVWmrXLpRXBpcviHAq2g4RXbRqBVAU
         N+2N5xDo39EEUi1MaieP0dLx+ZlUyh2JZ7PImhj8B+t3MQy9pDH4WCJYEQ2u2bCnq2Hk
         h3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304451; x=1788909251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujwtlEIxiB2YqKfbt6ZY/6X8zexWLJIuFtx8gmHU1I4=;
        b=XXWpKc2wYEPe16yGGGJcrSYnUAGC55Cv/KCkq/34vy1SGUSvH2TNdx7V0zz7j6arxV
         V9hvzR7U/MHjjwtOIHolC4OGEjc4/qEZfIWPqxZuOBDzmQykpvEOBrwUwHxyGk429oNn
         ZyqCV+KdR0VEKSTrFtmUsZhLTYPbbwOI4gSJKajGURTtF8v5ndfUF51UXkk+huqifxuw
         n9DN/weTg06YY5UYzW/wV2cIHnCAW3DTZtaw/ci2/nGzXaiJL/Wd9V9hP22A0CCNNaEO
         nthB7MPWcrfhHB54C8QIIHx0hCfbUobRTiTGbVj+HFlgB/pTthatuwQDNBhn6yi9b+jb
         n7HQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyIMj/GQLJTmEcvm4RamhwMxBpDyE3ZLAXdBZ5W9k/V+5NTEG+ddBkZ5dg9yV2qZR5u/G59yjnlis=@vger.kernel.org
X-Gm-Message-State: AFuF++lSCARbpmJfaxilMyKfIX+EKXOF0A1C6LIa99K9DRdJs+qjTjZK
	l91UhiAZ7WdOuAfnGqotWlwZzo4Tz+SOTjAUqhCo3QtS58v5JGZYqm9Ys2vP2ehDDrk+kARSRDt
	/5VfqOQ2e
X-Gm-Gg: AR+sD11TQiOHoh6LGI7QO+b37ZIy1oYug5cSEwuILR1kdobPxT0xD/0pKr2wspczqYq
	hOIFIWU2FpUtuenU0cgFJg1vPhQkX1gHGEjTtc4T5CQxV2CcivQ2no6BFnmj7weIDlL3BKHf2g7
	avwEv1putWrQF4mf8UIOQsdo6Kh2jIMKv9ynBBU6SSRfIv08QBZUPBgQZ25Zq4NHrR2b+T7PabO
	SBNEbWb6RmqsfFWck6PEfaNsGQbsl74uV5NQsSMofdF2aBn9DQHAQ89WK4+CGjq7Zb4PL9FnbAH
	cxgmz5fG6uiitcxS1Unjj2OkLncWXYVeUsMNHkrAnHXwGiV8c+kyPN+dfCbojC22YCv/PBqfrTP
	yOEDIlq83DU2LjgPvFiSpR+dv17trSFD69icAkuKsAFRVy6a05ZUmeISqt7gwio8bobHpV1sOxU
	Kiv87WpCYS6M3m/djbebuqioL8XQeKCAb8qgp42eLKKfAON6pKPlpyUgKhYVBi4bTfxXYplvs11
	PwkFlV2KptkIit77CNzGxCCqXfUicYpnaIjGs5gkQXVHtBnz7SKQiiISUbmqBBmGPDPrZD1o5b4
	WweFQY4ooJKo
X-Received: by 2002:a05:6300:388:b0:3d1:75f2:3f54 with SMTP id adf61e73a8af0-3d818ab8a2emr8320897637.18.1788304451213;
        Tue, 01 Sep 2026 16:14:11 -0700 (PDT)
Received: from cosinus.tail5d817.ts.net ([118.148.155.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc3881c6192sm117093a12.1.2026.09.01.16.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:14:10 -0700 (PDT)
From: Julian Oes <julian@oes.ch>
To: oneukum@suse.com
Cc: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Julian Oes <julian@oes.ch>
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in endpoint
Date: Wed,  2 Sep 2026 11:13:53 +1200
Message-ID: <20260901231355.114733-1-julian@oes.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 10:28:08AM +0200, Oliver Neukum wrote:
> But why do you get a port stalling?
> It seems your hardware is quite broken.

Maybe, yes, but as I wrote to Greg, I believe I have seen this (or
similar stalls) over the years in the past with various hardware.
Maybe it's just me but if it is not, it would be nice to fix it for
others too.

I am also trying to put together a reproducer with dummy_hcd and
raw-gadget that halts the bulk-in endpoint on demand, so this does not
depend on my hub. I will report back once I have run it.

> Your conceptual mistake is seeing the recovery from stall
> as an indivisible process. It is not, as it has two parts.
> Once your port is in a stall, you should send the feature
> request to unblock the halt. There is no reason to cancel the
> feature request if you close a port. You just need to refrain
> from resubmitting the read URB.

That makes sense. I'll try to fix that for v3.

> In fact, if you were to be really comprehensive you need
> to wait for the result of a feature request on the way
> when you reopen a port.

With the sequence below in close(), nothing is in flight by the time
close() returns, so as I understand it a reopen has nothing left to wait
for. Does that work?

> And that is a race condition. Rekilling does not help reliably.
> If your timing is unlucky enough any subsequent operation can be a nop.
> A correct sequence would be something like
>
> poison URBs -> cancel the works -> unpoison the URBs

Ok, what about:

	if (port->bulk_in_size) {
		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
			usb_poison_urb(port->read_urbs[i]);

		cancel_delayed_work_sync(&port->stall_work);

		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
			usb_unpoison_urb(port->read_urbs[i]);
	}

I will send it as v3 once it is clearer whether this is worth doing at
all.

Thanks,
Julian
