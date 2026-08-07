Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E124A47127E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102546; cv=pass; b=q+ENQIJze9Lqu+8jsfJGYEswmDZX+k2KYkvQXO/qPMBCM7ejB5qgwJQfcn8j9vaANgwFbMDiDAzfUPlF9I8RDiRzK4uTNBuk/Jn7mIkkKMzVDmDpAv4FqFJTQVNLojmnkjh/Ehg6SOGC+MtM1V2jk181k1lkh65KmpfnfVBuf6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102546; c=relaxed/simple;
	bh=KonotXRwXiSLQlw6vlTzZA1LY9JAAKMhrEBp5NWp/aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYAFlPtJkMVIncL2ZsSewFIGFbM/L9MqJLmaDmOyRdXsSKh0+SlXIRePOx0oyb/eDRJnrXc2j87u9C8eUppXRpzSJJWwjcpE1f5zFWua1MF8UYt1SIQZvSSQOLDBjZb8+tkxGRIkJmTr4LQRZvMRzJIKB0m22nvBdElBvBfp+bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gywRWkup; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gywRWkup"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ed073fed0so42195367b3.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786102544; cv=none;
        d=google.com; s=arc-20260327;
        b=qFWoc/Dj1IHAO9K08D6cGHX016CuRXZ6h+cuKAmgwER+D8KFj2CZh3yYAcime90eY2
         bWwdWOzScVV/K4HjhuHBu/RHBXcG3WN+C5xSiZHxd6aKNkWrbc2xZGCy5T9E4PrSZ03z
         0UjC6hropA2i9gWjAVmB3USPPfWMWGhGkqe0zWEmfpu9H5A03zwmsrCU3//oXuxYBFnj
         YNI05XZFoPRqRhIQcTiSy9z1K96kVN8PJhcpzjfcq86JgtGRDDMHHW7fiZrxpJueRjKc
         blSiyiie3Wfv80geGv11zWSpcDrIlFAz2PmrjTRGhZU4pU6/cDq4pp/xrJ9ctb5LZvmv
         +bsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        fh=w/euhXE08iQLukvcPdnV3tJG1OsNdj+Sg8ZX/dWCSfY=;
        b=Au4zDEX3rawaVEruAnstC1UaY22sBvlGhvpol+6Cc3urijFFy5SnTj8EVzU5DHCUPv
         iVQnnG+UFwfBwKPvfOS/xdLobKzsjZnSBawXHwiUGDptVk1m5D5kc/t68S23y3UOshoQ
         hfYUdD+yTVmiw+AmglaUS7ooWFoO5M9EiJmpcotJKxSXIXhmXnbXOmFwQ2uGRQjEgOSS
         nL12dUc9kHuyl5YeZKMSqNvOH65zwOUDF7HQlzeI6HT+LiWC2UrSEtsVJrbpa3N7yAp2
         dlz9pL3wQP/iOx7YFNOu6nyhA/URQoKounjfww7R7UGv1Cd14cBwDTdX7WaqBPx6jCAv
         139g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786102544; x=1786707344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=gywRWkupYdQcwx1CAxh1NJRwVrJW56NntIg+rqr98QrAOpyb8Sl9qH/7GgAkJNczIF
         ZqesRdYr5qrwH0RKrlknW/OgIQBDeZcA+0TSJWt0R41Fwu2j26OC4AW81eT6xGJ85gqH
         Dhhx6WGz4rhe7nooO4yzXrTK1Zg/O1jCa3jmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102544; x=1786707344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=YVqtW6GQsyC6yWn3uXgZ+1E4q0AzWKYYPjkXsm0FREvizJPkqQmC/7Tot5Tw8gikL0
         Gpjrfpr+HwzpbX28GF+rpNrWE+EGwAYvmWfQBw5mq9NzhH+2ZitKEkNdGIGvR11eCqLq
         MxOR1nw6WzZaBaKHaNWxK4Pbl6jCxSGPZJrnxwjfeO0Zw0GeU0A+euLYPcB5/HO7E93d
         EbfU/tJ/qMNU5wddUDVlO3A+6jvRIh5jQy8eO4uJKMjObgtsohhaE4lagnqmZFsBUM8S
         yEWATMd1e6raaSVwSQvWOiy6fnees8Cr+EPOKTLjWDylqlCUwFaoloejCQzovAR44HCg
         Eekw==
X-Forwarded-Encrypted: i=1; AHgh+RpvN8xSweL0POTFFQBD21d5SHI42X1zKEd+gphxJilBwCYERshzRpnRviJdfafJ+GdELFPMI126Q6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVo2jcTJ/54Pr5HxqYctwA9iVuFOfTC2T1vd4LVfobcbiMBdoD
	VcOCVe9qnS/JzxkoB4qiHISfJzRPh2VqQ4StAiOfEuksuO569k92zCZ2jhC783bqtWTt+yB1mDg
	nkF+uGfDS0Uz3AfQ9bwQBkg+I5618Za+bCAA37b1h
X-Gm-Gg: AR+sD10nHrS4WPKjlU+k150IGvTbXPEMp3O2C0q1kNbOTBoSsMUjX+/rk0Pcr2pLDb+
	+bTweE4B7D7f/jsNY0r5Ml0X9nTPrwWlbMm+gOCDJQt8Y8aTU7hh9NUX7wb/paO5d/FpoGWpmwJ
	riGGuqRPk2E/IFzzcULsqPrsiYTVsN274ollQvzn8CRFe+jLINsDm7y2pY1IspoJH0OQxtq+8fY
	sPqnmdetLzMAqhx0KPzkpm8/Y+y1YaSCzjevF7Z0GQBu3R6LSpERv/zoK4ZGzM8whmLV2vC25PJ
	P76bboyq8U28xNXILrHt/qwGO8E7jt9FybsLBH7h0Y6S9n6MUGu3xWBuan9Mb3I8mar2I82xKX8
	B3wMPSTi0fg==
X-Received: by 2002:a05:690c:480b:b0:81c:872a:5152 with SMTP id
 00721157ae682-82022510fcbmr127613327b3.30.1786102543795; Fri, 07 Aug 2026
 04:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org>
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 19:35:32 +0800
X-Gm-Features: AUfX_mzUutrA5-Q9ACqE0pQ_D7Us70orWiV3KcyO1fjFDW5_he5R56G8cIzEovo
Message-ID: <CAGXv+5ETE2WAA8jwnQKSe69aR=qrqKnALuiSM12X_ZwFouxdRA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Fri, Jul 24, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v7 of my attempt at integrating the power sequencing API into
> the USB core to support the USB connection on M.2 E-key slots. M.2
> E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
> Hopefully this is the last revision. However the pwrseq patches haven't
> been reviewed yet, and the fwnode patches need a review from the fwnode
> owners.
>

[...]

> Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
> driver. This is only used for the USB target, but there is no attempt
> to differentiate the connection type. The driver simply tries matching
> the "port@" node first, then falling back to the port parent or device's
> node.
>
> Patch 13 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 14 splits the Bluetooth power sequencing unit so that the USB and
> serdev consumers can separately toggle the actual state of W_DISABLE#2.
> This patch is purposefully not squashed into the previous one to provide
> a clear target for discussions.

[...]

>   power: sequencing: pcie-m2: support matching on remote "port" node
>   power: sequencing: pcie-m2: Add usb and sdio targets for E-key
>     connector
>   power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Could you take a look at the pcie-m2 patches? These are the only ones
that haven't been reviewed.


Thanks
ChenYu
