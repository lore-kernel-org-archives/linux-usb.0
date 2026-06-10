Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E13BE17B
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082039; cv=pass; b=WojSOc+1ZozSbAdJ0uWWq3Ao17yn0a2Iuz2BJ4RMNemFaNNcTBXTGz0P1aiahsCk/nma03dPQOQO6RnrugxPbd96VFyo7aa0faARdH4OfKlolgDR9HJ6g+RO1bNMqce/rXne+1GfBAGHGKpbz+hCXwu4ckSD4KqVcOivcOPOTv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082039; c=relaxed/simple;
	bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8SIXHwsWQ0yX2GZlW3obm0T1QCGwexqvzoVVYMFzAu5k5jf6bKMm3Zlr1cfrd5Rc/kAHePXEIGAEaYWtnlo0QABr1UqoOX0m4Shrb65yUoIcXqgUb1ROixx3X6cpC4MyQZTrEDXOLz4jMZzma+Q4W7eKUp3lbaoS+1KvHi2/ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hk0Zh+sY; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hk0Zh+sY"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ea6923cc94so65981287b3.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082037; cv=none;
        d=google.com; s=arc-20240605;
        b=gkag2xtE/igmomEbyAn5JLovbPSpsckzZJi9EpE33J6mg3M3Q73bxkxFX+EOTUA8wz
         4ghHNw3PHm/gVX143VMf7HLuajHxncdhGzcLnzD67CkQDMTEQScrF6ZB8FJ9ZyzzOJ8E
         Atxao0APk1Me48xiLK6dyZLk72B134lBMhYNtbZGX7H08DFVPwMHs9ECo6TxvnwEw8y+
         nXpB6DSPEdGQaB6uxCIkHlzYgTC4NvoKh6ggXQ3e0uH49UG78CGOARDgrCaCppgWHgyb
         7NH123oEg1EXXqbhL305c2a2DeO+UOcCAmD7RjwOBO+OyjXqkmo7LvJ1UNBJhZrhSfhh
         53tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        fh=lyLOp3TgsHrZd8DSZA54gvmJ4njrDV1leBfvnTuowjk=;
        b=Ro4DsrZtYWqubN+JHu8CkI9B8lCJ8cALdJGKsOT+oZRyHpQpx8V8A21qGVEGaF13fC
         Z/tyX9/g3bI2/aqqvSVnlW6inNvlHkNiXAv8griTuaN9PkpbzDYJTi0EFKcUtaJD5lPj
         CCy29FRhUD6OjnFVhGqnQiiLsDWvqewNjdNlqt6gW8U9tHU2kBiqsXJPFSpX9PpbGxjI
         +ivS+Wd5fqMVEzR/FqqSnH4cIH5vy7gox6crfs/l0FvJbGG+NRgacra++iD2rsSdnrNP
         8J10i0DhHSLNLW0QKcxqE388UHGzJLhGCpct1I4Q4KzPh4pqy+nUZpeYnVjkTIQI6CdX
         o5eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781082037; x=1781686837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=Hk0Zh+sYg13jIEQGiM/zoJFUZAyBdCKzaRaO9w3/+Ct/dDp+VZi6j/5rWvdh2rGcoj
         ysGqmg9X+N/rk+Jlo/OAoB0066b/spaORrvGb93ntsw52NsJCleS7f40UU6+nbvqrG4A
         5ezLBKWcdRidgvbZcthPs4STlzgNFGa0mHlGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082037; x=1781686837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=l5gznxPQVQLnNK9P/pJTUSxo+HXp1/ThTpYDQC1oH2GDkEF6n7BcNEjnVd4/eagcXa
         zG5g/iaQ9XgaiEr6Fh0jTBddgxxMtM4uMFHIWryIB1s1nUwrIcfAmyTIJ8s/CJwdf+HU
         c15HqePxz0QJ5Uvr9RUmfKd3ANfMahl+0crFGzn0QlkEb6LK5Cn0V1xE2KGOWPzmsPgc
         gCHT6Nol8Q5ujLmADuDhHa8d4XJ6VwOP8BEz95TNOg9V/2ypEzZ77f2uFDQc1phGqrjC
         P6xWmETnQGwOq/OK3Gz4lMBJQandjMzsrSX4JZmoGFdmDUOcneC1+DLYNj2PjNNQ90f6
         g6Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9WzNrXhv/glEu6mbctd19B9GsKx2NSYWz4XdX2Hnj9owRzbE3BrUCXy9CTSwiDvdTNBwPp4QnI3OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBdeVsvrI3DdN9x0DNkYDw/GoXOLhdWvYstsxP5ChjQKQiPc04
	LStdMgw9934AFTOTjYjnFAn7tMxUmVqhOvZpaZpbarjk4MiuNvRoxGh0PQ8oa7GeHISY+rDb5Nt
	VdmT2Z8RxKTjsAIX9Y/5lTAEIdM04jYJesRgXNPLp
X-Gm-Gg: Acq92OFuK4Hh1vk9IlSXdWXC7rauWB6sXRWnLX3y/nptf36x5f8HnRgqgbeQZMjkOus
	+MzHvOQYSgzAQ76ARZTikBk8lIyLsMqBFxpNFnkSoLVCb+SYFt8Xc4gL5mjHW6AyKogH+TRB4X6
	JwgkoJpR5xE+RtS+2ADg3PyDsPkcen33hpwc42GYwxDEuyqb74JqBZUdGw7V7C/OLhvLO0Na+CM
	C7QAmA2EAVxyxr/jd3EhnWJNST2LkMeX5o2X3UOtqYIDBFnOhz3WTzjsAPY/zLT2WAvglCY1PDI
	MsjYiDxI4ApRqKdtm5YDp7m+JELOcA==
X-Received: by 2002:a05:690c:6c08:b0:7bd:8d1e:39fb with SMTP id
 00721157ae682-7ed0a4ed459mr225795957b3.7.1781082036496; Wed, 10 Jun 2026
 02:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-4-wenst@chromium.org>
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Jun 2026 18:00:24 +0900
X-Gm-Features: AVVi8CflqNzYUTj7jVe9ENVhBouReNOK4zYnRNLDpQhNXfjJp66LGpOOH45Xjpg
Message-ID: <CAGXv+5ENxq3B63M-HnW95we+2r+WLfCLm5TZ820zWiC8FSakSg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING
 to bool
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.
>
> Change CONFIG_POWER_SEQUENCING to bool.

As Sashiko pointed out, CONFIG_USB is tristate. I was looking at the
wrong symbol. Please ignore this patch.


ChenYu
