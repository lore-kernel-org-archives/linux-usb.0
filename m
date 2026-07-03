Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D473D8122
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085171; cv=pass; b=D4i7M6PeLF162+lLlii6nEPsZaxYyb6NUzzADui1mrNDQ9zW6kQtNVoXSfvqBGhRWKCcJOJxhcMq3PWpkp/KzncEfRwCdOLdFCLhI4+dyzFKEEYgU4QZX9R0U9AtAbUdN7inX9D8uqs4LZnVfVrUOl+eRTp9eNAZVMF8Piw7Lk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085171; c=relaxed/simple;
	bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5RwexlOR4vGTxPyPLw9BbZQvSvoyXnHEpgziC1PrObQlJ2acDBf1DWSHeRAM5xJBXW6eEDQTJuWYImgXUai6MWPwKLaG/xgvQobdBX6zqiZtGIouokatTT/29UzfHdzljE3IlelA3Ij53TiavmwzqzZIgiOLIDtK6reaIoocv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KJrt8HfN; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KJrt8HfN"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664d35b4777so659803d50.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 06:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085167; cv=none;
        d=google.com; s=arc-20260327;
        b=YgekeM6nz9zC/FD2Cz8y7/ViJ24miToHwSYxKfAeAuCacOit94WOpaXBiR1PDey2My
         t0iJV+tbBAAQYLIHaQYe3Vzy+cR8FES11QqEPcSZ0PC1sQmLvXCaA5zTerl115B0Q6Px
         +rZM99NgksBXQOTbVQPTyq9CfCniW/wMIb6Mh/Iuk3wduYC156QU2QSpDqh/JCZlTeQ3
         CrXUL1itOh4rOME1pZyMSyTeB+LTPTPGS0av7aeQKmiRZt/pNm35loV7Vy/CLpbC2gsY
         pbH1oEIKMCKWxQDggm0WVnvTMyLbGRbNF4IMtDvIYONyyh6eKsXVoEiv+qwvPS/+Z6eK
         K2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        fh=7KukOXeyAMw++sT+kvvlsbDfx1wypYhTl7841hyAv6M=;
        b=m6rD6DRnliVle7kUjSBCMx2CHng/c13gEl32loODIZH3FPQxtPrEp8IBedkQu0yZr0
         pbla1EBJ9GcntG8ayUy5OKpHCAJdYfDga09BiB8Sir/BEJvx4R2fpcT4RcFIGgK4q5w8
         D12VYYMQ7sm0vlUTJz0bET8op9tXGYhma2+AhWZjld3EVcz2ghiXu4N/vBoQhOZ2Z/6l
         fDR24k6RCMAAwXGLwiv5bsTw0wwFoFh15+g+0aOXc7Bu/CrWdFMjUQJf5VIBJoUYVFzQ
         OBOhcZOx5zM+R1F7tOE8j5jHpjCxzJDPGZ32zrL1HHBL+6nD+Pfo5ex7ffap0+Tu9YWA
         ao/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085167; x=1783689967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=KJrt8HfNHAIjRwl1rngsaRwQF/9FG/CBUQfLIs6l/S0TOIfaVompOtGsf8X3bPYz2D
         RpHkamXeIR2v+GJi9wvXvM4EG3fqa1ExPuTLfmCtACLkWQ1SQRgq8Jnf8+Y6no5X9ShD
         3ZnIRWkysCQxSmaWU1XoTY7M6QhPv0auFgUNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085167; x=1783689967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=MoPV1MqpJITpHF/7ncMb7yODsegmi4jDqtphHWeB7bKZ0g8ZxgJjSfre0MVdTl6wWU
         x9cVxAmSUPRKGQcKGirBpLJlXTfboPZtOe/XHjfzn+Ad4DFBZKjpNSd+XNimlVp42NLj
         io032qXZsMOufwTZfrJPo/4r4kL20jmprQvN/aIP1PfpuT5lirjJZH+DkXiwEulswlzA
         MwA/Hv5sds8OyIhn48YUYHZcl3bu2uPkT3uS9Am18w7eDaxfIJnL2gxv47cgD8CvEsQw
         t8lQDinoQnS9uJCHPA0nS0Op7IIg7+Akxh5T3guKE8bE0bWaExKzzVDKdFY/Gym8pGiR
         FqYw==
X-Forwarded-Encrypted: i=1; AHgh+RrXmSu5dfIznQdSdcu2wAGzX8H6L+9qxtL6xeEvSGjpK5OXvJzhMRhK/mAYairibY8HzIsCQsmc8UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyufx3+AoyFyLIJy1eeLbT7Z+hrCjYykFkURPAN+0Izjzyn1RKV
	1FxI95bPoKGEBQ39f/rVfI1Zmr7zpopN2me8/bXPc9cxfHHu1w5yIHq795Wx8kY1rcldSMmBDW0
	4CluGe3DJAMHU1pqZm3VBOSSVRpXL/lvpyxkuNIKK
X-Gm-Gg: AfdE7ck/n0mo620gfn1Ir4wyVZShMa/uqURuASUS/iJgsKkbKHxL3HutRWtzbFJY8sz
	cqbKzVKlLgWayLUmlyxTe8YusKUfK4REHHSenvRFeFh3hJ2uPZQ+x4dXbD3waCpkeYTgHq/y/0m
	S74JI1roduJ+4A3u/AhVTj16swmq0UqVi8ou7xHCjS1w/lfudMfT/4XEzmCFraNTWI8v6yMaO4/
	gSZRT5cqlT0Erkqte0N/MceNTECEUCDPB+Vc6cOMdIpixkYCPJOBJ+PPeFjB3ThQBo0VzgCmAcJ
	7JiNT/mt00pqtRTxXd9oSKkP8+qbSHW1J+djcg==
X-Received: by 2002:a05:690e:480f:b0:664:fc22:36cd with SMTP id
 956f58d0204a3-66521ad34dcmr7426372d50.43.1783085167252; Fri, 03 Jul 2026
 06:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
In-Reply-To: <akeyxn390mVmYo83@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:25:56 +0800
X-Gm-Features: AVVi8CePOG6OpnrlSpGFhkpL2GOtwCFUk_NB8IIc5qFTOLO5i-BW3OK69XKCfdo
Message-ID: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> Now I'm more confident that it does not mess up with ACPI case.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you and Bartosz for the reviews.

FTR Sashiko pointed out that this is likely leaking a fwnode reference.
I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
in the next version.


ChenYu
