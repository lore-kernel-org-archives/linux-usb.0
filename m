Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F913988E1
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255537; cv=pass; b=LWoncIEawrVom0rsHe0WBPhkamK8tyfYrSwPnamZBRCVaArMex1j2XSahAx+mlL6tuiyx69tBj2T3q9jWSVpxbkVK3+2NfXWtus8ME4z6Mka9515yRBPxY21y1QfxFvtE9BPBPXP+m7UMIz/nK6Fe+IoGyfS2tDfqoyL9Qc80Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255537; c=relaxed/simple;
	bh=V9+QmrpZdZ64QkPAYEa/J5l5l39WRUXFgGRxiy0LOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8qAAm8VH7gSVshG8gh3Lo7Hy9SniscpVeGkMiRYpDsAED65YUwzYU2xBKOOZtOsmMwPFa5bEqeYW53PRGGl3rA/VuimtRlUA7IRyRt/L/R1HZ1+gJixywcjKL+J7UDX1M1Z0LyGuUPQPgh+ERpCqxJ0rsUF6ODENvJ4Y9u6gt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VY6z8Y27; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VY6z8Y27"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7de68222e96so5794337b3.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 02:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255532; cv=none;
        d=google.com; s=arc-20240605;
        b=S35qK8+Nb4p4P7OJ70VyCDwREqCW9NEaulcCvrjF0tLSVPw7xIZekcNwjOOwlcZY2r
         h+7xtAYvQxExjCgs1DJW6kin8uZNMl72ImLkPRMJdgorQpA0ZOWo28dHE/Ssp84bb12q
         3wnTxsuXZVF/cfVTX34aX3mK8pZCMCj834dftXZDoSgLtm6kQHfrEAwL5nYMXKJQfJGY
         NGc/SFpa1yTj4ES9PfXTwKphXbT//yq2xYHu/spO/tfw7vItIPwDWSWnFfrYpe/9YdPl
         C8PUzeexBAdIsR71dXsOeinLA8rHGyIqSrslWQveFYldhAH0DZZjmU3sN3z0s6oydJlm
         v7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        fh=1p6ocFm16sEOnHan1APmJatfU2AuoRV54jfjtnu3Hzc=;
        b=giUikZjs0/excnZC0rzopNL90bfh9MhTUzpBVUH89MOyRuGAO1qKnJ/ASp5mJrAcwf
         7imINm3M7n+j2PZ26q5byPFsOWxmMwbHSr6GRSIWbshaISWgdHRlIhV9IDBM+ESKWXfv
         I3L72RxolpXT6oqJcgsSvF2rd58bCSKxs6RXMydNZasqz/+BgHZhhVXjWukgyllKXBXz
         JZCZuH0cez5zkW2PM38ETRWU/2XB9jnjMaL0J/Y1A3QphkgwxhRv9nuDVDVN+8NGvUu3
         OLva7ovHeCrgA8KLlEUU5k3wXkXZM8XvEDioqk1s0FpTzXZ/gXgwDIRCsGF2HbfJ23TK
         zlGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255532; x=1781860332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=VY6z8Y27Bq/k1VaXQDtfw4d6RhDkAb7ja36E1h1GoBPyxh8YLLuJ0VGxGCciWhduL3
         K6pOSFQWx1us+l10HBVmKuj+38x5U1b+jmRjcTWKFAb1lZmSa9x2dBwuyDpyBhsriic0
         0cEp83ACaRF9R3X5w43ashV/jsuNNogzc5ovw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255532; x=1781860332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=dal/uerbS1HSYA+on+wP/tca86RXKCZgYMRDOlUK62zv2S8OcyCtIVmxzifBNhgLIt
         o6ylebYhYXijoGjBkxTQMzzJCTxrtB+XCN22GataTsyVJhSqg7K+kWX8RtV2R0CpYW+X
         N7F0ZePsyKeaqd5M1yxR7vQRuvw46syJFyO+fa3uRoNsL+fYN1B4wi+QfP0gpsmccCpC
         dWzcDNoNzZfG4l1P/PmUKFl5XWc3NKzuC9TOab56OhsTZsTsUfImindKSgG5aK4+KSdP
         FEnsYozP4iyXToDZR6jKmijpuhx0ZBgeqFz5LvtjnKns5N3/y1JwuXSlsIZB9reWOQX/
         sWMw==
X-Forwarded-Encrypted: i=1; AFNElJ9PjgxFnq1ZcW184ob+zaKwB2MwwPHolQnzATgSOleagXf97Bt7nmNi3jg2E32SVamzZry6Az+C75s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSYSmOPZjrj+dLhKzkNJBcUbg0tN6iTFrHgmQ7mtXIBR4XaVw
	S77WtoJAv3ZC2zPXzlkeOdzkhjblT3rbZSbSMHhxOytDUAmquokmUqCRWVl5dcqz8cetMFXBeP2
	ruWKezP+b8tiZ0/WVINXPTYbrpCCFNpCO/nJbRbAl
X-Gm-Gg: Acq92OE0zAs0F3tQCAIb8NubdWhorj05MvPUVl0kE37Omg8iq9obvW4TSpjvk+XD9zR
	Vk7Fe0ahj5Dk1RqjNGX0gg6glsMER0eQo2uwIdETVbMboXSsJQIozzHQLvctVh28X4PCSC2Gp4L
	OBl0mzrQMxCkEyozkiUPjZSEU8GGMUD2M9YiEMR8kMjNJ9ayDBGkCrbROK6zbjIE9eoxknDycKO
	rMz47Gxlz3I43e4WUgsAJleiXbJxd91TTmwVkIuxJm9MgGfLLSnXhcEYp2864LWnl5cY7dc9pvJ
	fkPPOWyb
X-Received: by 2002:a05:690c:f0a:b0:7ef:d039:a334 with SMTP id
 00721157ae682-7f7bcf0d73cmr16871217b3.22.1781255532401; Fri, 12 Jun 2026
 02:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-11-wenst@chromium.org>
 <ail1sAxgh5Xtkj2y@ashevche-desk.local>
In-Reply-To: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:12:01 +0900
X-Gm-Features: AVVi8Cc47lUt9lrnuGQ2TayhjSsjO0Ufug4-8BS--usEeOHUYmKa3VTCiJvbq60
Message-ID: <CAGXv+5Fkp9R3i+WnCunbydJpn_rjxX5Cz9Cb=auS-cR1RE=R8g@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> > A USB hub can have multiple ports, and this driver needs to
> > differentiate which port is being matched to. The USB hub driver now
> > associates the "port" node with the usb_port device, so here we can
> > use the remote "port" node to check for a match. Then fall back to
> > the remote device node for the other connection types.
>
> ...
>
> > +             if (remote_port && remote_port =3D=3D dev_of_node(dev))
> > +                     return PWRSEQ_MATCH_OK;
> >               if (remote && (remote =3D=3D dev_of_node(dev)))
> >                       return PWRSEQ_MATCH_OK;
>
> We have device_match_of_node() IIRC the name of that API.

Ack. Will also replace the existing instance.
