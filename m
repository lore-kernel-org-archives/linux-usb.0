Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41983D0C1D
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081053; cv=pass; b=KFDWq+vrkQ9t7UQI18A0hbgwXpNZbaBakRXxJILIgwO4P/i5AdCk3FkPpRXnvYp009EM2k/ioEOd7XhPlsjS0DVp9qKIN57TtGUeNQD1zz3l72ZY5Amw8UUCAEEJ5oI5VLgmahiqhJf0b3lEuQfkD/Tdart0hMcX6fkPR18ZFYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081053; c=relaxed/simple;
	bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfYz5ajsFrmvU3GJo4VoABHj5z7eSiUk6zSy8ZFhirCPK7/V01DTTTpQAvJVMf9weBFQ3JinWTPEeJ/rft3ZFTg+9mFbHsWGIGTtDFb7AL1wzmHYx0FGtRLaFIFS3WCpa17f7hGcXC6nBQXVcQYr+YBj4TjLablGQc3wqv/WLk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=La4rLw5G; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="La4rLw5G"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6662551100bso682487d50.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 05:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081051; cv=none;
        d=google.com; s=arc-20260327;
        b=iaoU7LL1h8CxWvC9gat7eU45o/lNmjhoLNbRm0W6LUIrA2QlF62KQuhbOFCi8teeUR
         N13zgTWW6blK8wfI2K2FuR3yJu30DBUyR5DmdUyuK0aqhpunpIXsWwzUI2cK0Ai4sYBu
         SiRL9w7LJ7pNRzqdkgCEgnhGSwvOYfFDzQbipFm+0xkemDlVhM6ehSoZhL4yFCbxH4Ma
         woDAC0m2clwK+tF712dMVDk53rUUtq8HuV2NERiEvHOStBf0UWTGWeoNZNj4tXy6tY3v
         fvwC/MbX5sve10v6XxzS29Rj6YmhZ7HUO+t/Dm1FW9r+0AslSbxMp95SoEJHDRm2DLdp
         M0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        fh=IDOhCVcbQylZT9M2YYM7S4a2Ac3ud/xW2bC3YyfEHdM=;
        b=FYeHj35ZrquUT/w7UPygT5ibzQoGUg3J0V0II9uHb198kN3kbN2AuAveb5ZBHWuSMe
         SdaNfWuhEUljjZlNIWY/EMhZFB1oBpy8Acexrohgx48jEMZLCayRvt0yuG1J6Im3N99M
         fZBCwAM7mJCVS1W1WamQ1Cy02tlXd6Mvth8yrbZuObRV3sMWZwxea0Q5SoUt1g3CJ+di
         kGIZb8nTlNPvaW2vFPJxx00e+csvB/A6xk23mlW1QaK6zJ8xGPetq7ilhJl80tIOq9zh
         5L6spHHHNf/9dAWLzCdWkT+Nvis57/mdjk2odv9hgFHUJNVQdTV1b9NGa8FSN9EtDiP3
         sL1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783081051; x=1783685851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=La4rLw5Gf5gqClv10KJUzRgbRZWpkKExtGoirU0CX9a9jrQYpre1JYB5m/lZqJPlf0
         3cYEc+cCqrXzelFvrandfTJ1HTW1qcjS4V28uWSp/W6eKpaaI5WeEngCHPnPmiZ1hWWd
         iGuEVo1TxLdpP8k9+6p9LSymgO+vPjFK4hGRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081051; x=1783685851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=oAnoMAGkHCYYV0pu4uMw1TdTfHs8OZem+dF3pZf04eYKxGnRWdRvIeK97+iAtBu6PN
         WQLjcJkTSYfnvwvtZKqOaN3eKVZrDN5XHDYxqqgfXPaudQV+/G+fBDAlB3eDkhTKGTDK
         8XDXzix6tad7hkZhjdxglSspf0vLiROd7nocaXCLAz3IgSeoj/aWEhiBcXnpVCxJUSP1
         Fe+LBy/YKriAESUOKPGtbWlEIab2nb7wLfH/5co9TCB+uFqts+VP/vxKeUzPhO5ec0z+
         JNjGU5OZBtULiDebbnWgP1qemUfs+zLmUAVGScdz5iOJ+HK++BW659ltrT26gIrTedac
         BLpA==
X-Forwarded-Encrypted: i=1; AHgh+RoK7/b382R5ePucK2p+2gAzbWNkIbsibUS0xZSKm6bw0zIKWZjehG31cKFFF+thfkJJsrW6El+5zbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcnPMnyhR3PMitqzB4vRf7Bls9rBmITSxdo7osHOFqsjM8ew6
	vtqJpF+XvE3uyzO69CCNfkW9rCGO3R2JGeAtLsQmbkY6jmycusw0SNwTJJb9yLPBoAKK7QC6wrc
	b+eMMc+WZZHad/QU77KyZXsDJTboWHtdOkD/WB2Jq
X-Gm-Gg: AfdE7ckve2RJqvk4h+Z1ELEr/TZUZ+vv1nWyAipJVRsEBfeNgrAMFLPUJRfSHzQIYDK
	VPW4P44ajUp19IE3XnVeQOiUljzbCzGdkzCVibws+8eCsb/8Ecl8fzQezHceyvaPVGqq7EU52+F
	m8rrownfnmtqCRcQnC6LCeS6rRVet0/eFwjlYI3DsKxolZkH8rXWUffeSb3/RsDVQ8OGQeNKOzY
	AZnTCew/Z9XPg1BOLtbEbnKzvQk++WKqLVEoNgiYW5cmK0fTsA+oMCn1A1DJ8NnSyKBI1sRwGYe
	FdNvrq32cxfNG9vY5RGgQZtRP9Q=
X-Received: by 2002:a05:690e:bcd:b0:664:ae03:524e with SMTP id
 956f58d0204a3-6652195244emr9486423d50.6.1783081050982; Fri, 03 Jul 2026
 05:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
In-Reply-To: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:17:19 +0800
X-Gm-Features: AVVi8CdRG77FVnl6YqrCOnoh5pU554e35My8Xh7iayyOJ32J-OMwjYcWxPxxPu4
Message-ID: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
>
> They wouldn't be able to do it as the field is private to pwrseq core any=
way.

Which is why a helper is added? Note this is returning the requested state
on the consumer side, not the actual state.

> In what situation would consumers need this? Typically you know what stat=
e the
> handle is in if you control it.

Mostly just to avoid extra tracking in the USB port device. For the hub's
port power feature flag, the hub driver actually queries the hub for the
current state; no in-kernel tracking is involved, i.e. the consumer doesn't
actually know what state it is currently in.


ChenYu
