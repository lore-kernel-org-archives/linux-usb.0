Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB194A8A3A
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151291; cv=pass; b=QFb8HBcmZ0zczfKxMQogJFB0THLeYqvr/EYQtXHQYZq0Vj+rLcAYofoSJrJH5t54hlLESM7PuYH5HaD/UWl46dQvCdvPW1DZ6tn9KAOlxsqtaBT2uyyb7oB3TSjVQePCPnS7aV8IEs98r4srmFUxWCrAcSKTvFC6W6ddI6TUAbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151291; c=relaxed/simple;
	bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWJcsSIJgFubalP8VAZHUcW+WdFJbsLYJae77NFcqxDCwNIfIWRQukd8AENFA2zGHFQHp6gd/Q8r1DfFTxt2LD4YjPC9/xGUxY5+hLTtqBZOvDxW756Nn3IhiJfq4qdtcclmU/rGvRtBI51FRYitW6oaFVmndyThBiG8GGxd47s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jRnft8B5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jRnft8B5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so65241f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 11:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151288; cv=none;
        d=google.com; s=arc-20260327;
        b=EwW2EfJRQW27H0rQZQrGfj75IPvinfXw6x7bM0HvRT0yi/01r/kdSr8hbSFybB8Sd3
         IEV1S39FtGvD7GR/WIFnrH8vyUWTJdaUKmUu3QnBz179aWIooDm9HE7hfAGpZm2AhdNO
         A3dgnVk+te5x9G0iFK19Qvy3BjOzA1aBsWas8n4NS476LHN+bsXxp8TcbKmISUdmj9zd
         0SRMu47uIUhYwnmIn1jlxxqmBut0H4GaYRjR4RIm4Fk1wQJHSI6XR9FaWeIj56AwRgyk
         cQkjvq4NsIXVX6id/UZ2RSz4jtG/eEE4FXHQQeyw2E2XxYQtnC+4qA/9NCT3S1x69hdW
         PqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        fh=jZGoo2prGtwidBbaZXeRvxLRTulp5PfRXklLzFcpPxM=;
        b=joFAdb7BY7Zlvmzb0EDZAVM9wdvmCpXu8+hRFlFgE04m6d3GRhiBXITVmGha08XYyE
         srvU3KxK348hhWcyw3yckHSbSTUraXUdocWN6fqRMWFt4zSSeUzqfx7IAokG/OvkUPKN
         7z0SnKqUZ+gB1TSTnwtu1gXeNfbHeWRU8kO+2rh1RXV62/lCo6/OtgYu61Ff9SHDMDio
         AmiprJKGsa5SRfZYc9fvHoZv0PAgY2mC2Ba84rge+LK0ItVYBcAoVZI2PfyUyhjNxxkl
         ocSuEMrNqB8DUk9S8lAf3a44cOr3sxBs2litWIMnwVXvZUzwBuxBaHFN+zetyqGSgy/4
         ul5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151288; x=1789756088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        b=jRnft8B5UGDOkTwcFD420fwte2Et9asVQD9na48sP31wLIrhJfZqpNw6aKvO5Zm/5S
         3d0n2jordDICmvg0OjV30YeSiyCiiaKYB+uehjbc/wpzE/WlFJOi5AJdG1J46b6J139b
         wZ7QEOMtFemVOh6nnbNnFlfoxjc/UuAKYslNgOHjM+aSSNeR8g0rib7sLhMkLAntPoFb
         /+jMBJX+1qL50lOBMHjHXa9p0Y7lxLdXyLjTQW5uXf2yPb6l5H8iH8pRKGYOjEIhMXrU
         lkKETvhYWiQrmVWyv+FwuUZn4rFrObZVBY0R5XkDZQw7JMK4K7SEz0+gDg8sNLYckPZE
         Jw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151288; x=1789756088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        b=SMe58HVMqopDd/C7hV5/UP+uA4dqxBLMbDSQQieuv6+YPP1TUmgxbzzfHfF6T62QAK
         X9gLlJcoNlAMch3FWkcJfIDA2H70bTTj5IQHalxnF4agvx4pZ2eHSh1li81aUjZgrZWs
         OJO1oVRoFQt5WOr2Ixg5KwUH2He94rjxwzBBt+7+cDlH3ebDQod6VcalQl3aNzjMYJf0
         oRyyQ7zzgIDfLY2kRD6BMcUPXh/3/ffDXlODsg+jwGOnc6rzRRcVXxryxIFdbT0Oq/gE
         guxEkptBNUAFaZ1OctdWMeMxcV5fCpS+W1gmtKLxqFFP/OBarycA5XeO+7BIqB8TWtIu
         UbfA==
X-Forwarded-Encrypted: i=1; AKwUvBxouQSUub9JGna1evx0bE2TaHKhGw4F/1+T9Xgfee9ciRGW/rAk5g4WMVJQYXt+EcSorpPEukPSsPI=@vger.kernel.org
X-Gm-Message-State: AFuF++nkljj28yr2+w0yoLG5TFqP092hn2comR/U7Jv1hO1N/H0DGPQg
	sXrUyqeweh499R21YMyI+3Jm7ZxFPyA/QJtNGhskDF3ux8rmyo+HTzSB+BpoPyPqeSfHFzN6TYD
	azaYX/twS/MzcGz3fYNhxKDaiSkX4IlOvj9f1V5Vq
X-Gm-Gg: AYBFou0+Ixr0S+9/BuPzhng1fXTee1H5opk3HYAsseuypjuochvFHGPkjn9xnZaZnfh
	d1djGmK15hI9LEeWWpVaM8ZCK1/JKYp835+J/lXpLzDs+XLqATtitWW1P4/BRyYmLCfEMc5liEF
	LoaV3nTwo1injch38jD59JNMqlHvRcNO/yfd4AnNKqqqoWnQnKNgT9TSRmfuo+hqm9IGn++UHYD
	c50IniMZPHD8SwM9/cRKTVaS0l7san4bnFSJAre8MTwuJ1GOhQVGcMSTuDCp9ZVe2jsRAnfNNtY
	PdCWVXQa3R+2HGl/moFe2x/ora8ZWS666s8cban3TtaM7UotxqvMoPiowIK+notiflzmg25TXNP
	bZi+2jrRyDQ==
X-Received: by 2002:a5d:5887:0:b0:485:ae8d:1e07 with SMTP id
 ffacd0b85a97d-486eb3543c0mr6951383f8f.56.1789151287712; Fri, 11 Sep 2026
 11:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com> <2026091023-numeric-husband-1b03@gregkh>
 <CAMFSARfnRpkq21j7WZYqdthy4aC7VSPjQAKm1eHvbYxhM6pOnQ@mail.gmail.com> <2026091139-spindle-zodiac-2342@gregkh>
In-Reply-To: <2026091139-spindle-zodiac-2342@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Fri, 11 Sep 2026 11:27:55 -0700
X-Gm-Features: AcwNN1WsFlTMBvEiNMDzIzZo5OmwjBJhmGTnyMtJQR0FexDEekyndWgnFLMhtM4
Message-ID: <CAMFSARdSyB9m72r0gpujZmknN_aDVUnyOzKHfdksKhemfzcUhg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:

> Why not just a fixup patch instead?

Sorry, wasn't aware this was an option. I'll send a fixup patch to address =
this.
