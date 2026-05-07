Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5816132A
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170635; cv=pass; b=NMaqOD62KsmTZaeUMy3286c3F39ozyTnNvJ2QCTbOYhcCGz3ILSy1zRrdJzJnABmivCkk1/k2kzSEUUniO7vgCZ6CShLASqLOew1Xpbed2rIlRHIW9/LsjwyxcFM85sMsasWNmJjIz/Vi/ofmMO6pkVoxs30/mApulc1NBcxs4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170635; c=relaxed/simple;
	bh=4zmDwezSHskdG1yFnjxWqfAy5RyolxjqtPuU4nY23nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYvp3Z0klwTatbSb4OUkUseFRqVvbJtTL9G0pugMO2VDwv07sLuh1yAq0EdQ3m9qrrIteZ4826BDjbknpZnk4ks6F0A/ATPf1Jycu1q/zcCArjT3aL0DYO6Ac4vL5cOV+V+3SeDJ1YX7fz+WqDiVtbwA1WBDZZWxHr9HDex6MzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=H1UzsUVO; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="H1UzsUVO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so2110868a12.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 09:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778170632; cv=none;
        d=google.com; s=arc-20240605;
        b=dxOnBWCUa9Y3yzaskVSUeIW/FVfMzzrX3IYzX7kTi2499oPHM6NPBiBrp4/OPVTh7r
         /u+wVzaOT4kgkKPJDfpnaLixyHA/x1pryty0fvRWE4cCZpO7tw2oeyPoa11OMLm41MZ0
         GEWwY6Oyz4nY0OUfrMu0EnvAsdC4OZ/GdxZG2YGIADBehy369uqjU8gE/U7ZFxZZJMHR
         2mJp8FVC4S/dbxRaoOCRZBu1xMtdFRwNWTOLKsIbfZqZTBPf/Fzft6zqEwHaDZmXdGNL
         40whYRrRycmzsOnVoSIGGxGG1zUuC8kqDX8zYX6/URhWnktfJ85+HNuYCRtlb2cx0l/m
         qgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a+HmMuz3dWXQgVrFIxgF83ZXDK3/qjPvk7d6ng96qUQ=;
        fh=IwtSbyP7ybH5gNb4Jqk0PuWQKJHgDCfCsLL/kZKlpUI=;
        b=WhKqeTC1iNgUS7Uw7keNaVSYmSRggabsyPSku4KGjZLiu+TyfubablpmWzH1snG9Z6
         E+Ad4vgf6+Q3nclWiLkwk+5AnXuzNPWbmNGExOF6/F7fLJPnc95xAADvnozUjaskdi9v
         VftFbza95UB2oS3hQUKYDazPXyBrUWKupIqVRlPnoHTVjcgMuG/hIQDJcosZCYn6BxNe
         FdgOZUQUYKcss6CP9NVPO5H6PsQBbnsqlKm09C+Reacf83aTaq7CQ1fcsp42XtQw7vYV
         CNIzS5iH7G2871VxT1OsBw0lOfEcom43vW+4+FQRDHyQ4L4lOt3phhtkE8/DpP8l96Yl
         Kweg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778170632; x=1778775432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+HmMuz3dWXQgVrFIxgF83ZXDK3/qjPvk7d6ng96qUQ=;
        b=H1UzsUVOllVpwmlMeomLWubZVTryLAnRvEULzkZUR2c/8q/tiSYRZj4oTt67ATTiIo
         PnxXfwdU07OT20TDj4TyrkWWmQIzrpNemtIHW6HEt5nu8daZN2lqRtc/GCeUzNqqO11U
         u0r9lLR338shsiZNg951Sc/tk/BtKCLHl4BJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778170632; x=1778775432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+HmMuz3dWXQgVrFIxgF83ZXDK3/qjPvk7d6ng96qUQ=;
        b=KXYmMNKSqFsMoa2Bn68NyHhh3gsUAp+iDDTG/1amhuABlVYVVECCuqKn8M8A4WOkOJ
         w1wQG6JKHXwzeSISsKLXB/tZtEWcyS4ut7D435ylJmQEH8s2krZQO238EYadbUjCISed
         ldZZBdB9+u3AqAOp9+McsxqJPCxDB8UgX1dbLoi0T4Qi8XVc75HopBHUYshTYYyBegVl
         +57NoBVYz+QWvAoJ7mKImbtKLNZtExewVhOtXaC5Vd8KK6umpZ6aCqnnjlapMS6e5fzz
         9Nxx51vS3KqyLs8Q8QQ26h+gEy5X/u/qm5eqyyJE+3QOiYKjvshTBZkqRnroc26kTjl4
         qcXg==
X-Gm-Message-State: AOJu0YyirZ9dzGMWFORSLZE9mBH2ocGPMi0aEYNHzCKpPCv7C5DnCE49
	I+yWA9VkKE/eOo/oGNd2q/doB0Hx07JINNhzqD/yByRPNRmX1k5lcUBJjgeq2rGqVHXAfoI+kcq
	Ek3zkLdx63fz2YbAOofEUuNoYniHKe1aJjWObteBdDSEo8ruk0Jp5Pu4=
X-Gm-Gg: AeBDieuZpcuYuSY2yK0RRXMjpdniS4z6+YXrzS5wKxMBAc9tAGXnDlkHyvSAkIMdvYY
	2HBYpkz2lxrpc5vaPbxuW50hlml9C5DClECVdD/LJQtaOQJ1G+TrnUDiFizNnhCqqk1aXtyIeEL
	kjPamPIhofaI6L6glp2zOwC3l+Ud9AOqrKu3s2H34MMKrYL37stzvu3BhZCl/X8OmnemoVvoN2p
	t5UWuIDiIDVWWfOyQFifCoua543FdHtO71lbx75oj/rxz5tqWh+NWgoEuMlKopHwarynJC2Qew+
	cUndstLN
X-Received: by 2002:a05:6402:a2c6:20b0:67c:34bb:1bd1 with SMTP id
 4fb4d7f45d1cf-67e0dbfa2d3mr1396189a12.1.1778170631826; Thu, 07 May 2026
 09:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
In-Reply-To: <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 7 May 2026 12:17:00 -0400
X-Gm-Features: AVHnY4KebcfHztWqRcOlmjTq6OUo7kDFc3uUIfW08ma1CLftabq7osnvHyWDRbs
Message-ID: <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:39=E2=80=AFPM Alan Stern wrote:
> For one thing, that would be very impractical, as every driver using
> isochronous transfers would then have to be modified.

Maybe adding a new flag would make more sense then.

I was confused because the documentation regarding URB_ISO_ASAP
describes this behavior.

- For ISO there are two startup behaviors: Specified start_frame or ASAP.
- For ASAP set ``URB_ISO_ASAP`` in transfer_flags.

However, it looks like URB_ISO_ASAP actually means something
different: that the URB can be delayed. Is that correct?

> For another, what's the point?

The point would be to allow the driver to start a stream on a
particular frame relative to another stream, ensuring deterministic
latency between the two.

> In an ongoing stream, all this would
> allow the driver to do would be to break the continuity of the stream.

For an ongoing stream I would expect that submitting a start_frame
that is discontinuous and in the past would result in either a
submission failure or immediate completion with an error status. Such
an error would provide useful feedback to the driver because its
occurrence would mean the stream is no longer synchronized as the
driver expects.

> At the start of a fresh stream, the driver could easily end up
> requesting the HCD to put the first transaction in a (micro)frame that
> the endpoint isn't scheduled to use or is beyond the end of the HCD's
> scheduling window.

If the driver requests a specific start frame, it should be the
driver's responsibility to ensure it is a valid frame within the valid
scheduling window. If the requested start frame is invalid or outside
the host controller driver's valid scheduling window, the request
should fail. This would be more helpful than silently fixing it upon
submission.

> >  In looking into porting our
> > drivers to Linux, we've found the current behavior challenging to accom=
modate.
> In what way?  What is it you want to do that you find challenging?

In order to offer predictable round trip latency though the host, we
have to be able to correlate the frame time of transfers on the IN
pipe to transfers on the OUT pipe. Therefore, our drivers need to
determine the frame in which a transfer occurs.

Currently, with non-CFC host controllers, there is no way to determine
which frame a transfer occurs in. This is because without CFC, the
start_frame returned in the URB is only approximate.

> And thereby forcing every URB to contain an integral number of frames'
> worth of transactions, at the risk of breaking the stream's continuity?

AFAIK, xHCI doesn't allow scheduling transfers on arbitrary microframe
indexes, only on frame boundaries. URBs could still contain a
non-integral number of frames by putting the same start_frame in
multiple URBs (just like the TDs used by the hardware). Alternatively,
the initial frame-aligned URB could have a specific start_frame and
the subsequent ones could be submitted as start immediately after.

Ultimately, we care about the ability to start a stream on a
particular frame and maintain its continuity after starting.

Currently, there is no straightforward way to inform the xhci driver
whether a URB represents a stream start or continuation. This makes it
difficult to detect missed service intervals or other scheduling
discontinuities.

Dylan
