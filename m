Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D80647F772
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524554; cv=none; b=pieWGNCPTKqCh4VF1Oy6eSSKFkjNzUPQRF8fqP4yhgjje4KjGaDHxfd6mZqCtmv5vcaJ8r4KE4hptwZM7lCxhFyEjYyEfYjSaaJMAXrFQ4XT+eQ862Hv2fIv0NNQSi1rti1dFpUJ7lL7d1dwHklYJ/1iK8/sKu8AZpybdoGQ23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524554; c=relaxed/simple;
	bh=vjaQgjeSeDSWekFLIKX6/r8ecgd8zwyE1GwfTXL4Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/IPL/N+x+V8xR/vS3u5tgZt2eTY0Im0bY+sqVvvd7abcIb2/IG+agIL9GZCNDRyvLVyhcTUTb5PA6o+BRna6I11Z43o4Xj9PHW0xV0VxFNgkVtuvvIbj8t9Ra85fYv9RGM+DPl3p6QkoA6Fpi6/2yEQIcUFF+SBP7u7XNxdsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-75e2905c09aso201970137.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 05:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524551; x=1789129351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mDtuYgjcDY/xg58xIH9H2reGhfYioaWqgEAldYn7pM=;
        b=Rt73Lc5xxUYZgccR933Wdky3fhP0RT//2nthPY6ezneLHauQNQSOrtdslBhDXEvGs7
         8DQiRgenv37vaQEFIm9vr2VQWIf1PQNFo9eEllxy4gzG/8UkURnD5zsb/Hd6GTL/3LJk
         uOQ6t4y1qFN5Hm4jpHwy5Fko8REWzaoC+fFx8+NrXOMmv9eMOvVIMeyAW1BZSfjsxRm7
         rscdKEbeDaAih9CTl6GayO3mVy250TIkH5Lq0K/tEHYMFDxvzkAI1QI3Sxam3C7TeXCJ
         js3tj0CE9P7KbAuZFNT9BQk/ZCdtpKjnuCHuaw8dyRwHYooCe7fJ6HcWEcgOYSP4XDc4
         CzMg==
X-Forwarded-Encrypted: i=1; AKwUvByCxtBK0Eo1qOCOEWOOD6JJttZfXYrPX28TbwpMu/1VKf3ttdZjEOck4yPqVLVVndXicebdBXWUyhA=@vger.kernel.org
X-Gm-Message-State: AFuF++krhSUFq07cA1UcQzMnts5Ej5N8FqHYT6f6QJ2maTYeYmk9u28B
	wxxAhL53DJi6yx1KI71At6Vfwn5yNFv7PXVsODx1OzyaPI3pMPh46+mtkooNY2M6wHk=
X-Gm-Gg: AYBFou2sSUFWXtRQgDdPVgqn+bOIUO71bCCrEKevImsLrRWcBWplvq0fVqwjrWO3hxz
	AWkfQQGwsOhTNRX2Pn+oy6mPxGknkSlh3kmHZ/CoJuiSw4FdqlXVpktl2Bcqx+Z0VDZnUhrOgc8
	0pXRjXRMgJQH3rksEvnl5KZCau1URXD3CFK07erAsYT9Dq54ROpQkyBRG2k0r1o+knAfBchsAAQ
	df2OujHGzbIRIq0MxTdBnvl3cnqXRNymZf8vEdzvDD7TGoYloGZ0yYx3HL9L1hUA6rgS5UWW/SR
	kmvqiaGpz676gKG2V9VOmqeUUSpusJB5OINiHwQl1XOYL5hetcW3ZS5QDoxSeAwuaakr8TFghWg
	GuKjA1Gc70nUAdXm7IsmXt+YTWFUV5TAhOKloU98KHqGLPT4/HSAZWLTsiQDquhDv4stF+d91kL
	xL1jQI+V1vgmVfiIPXDUqUnzjy5KikBgZV+OROkcIwH+j1abkOCxZtE3L/LjT0kYqy0ns5u0BP8
	vBTqzowl8e61lCYydWMAQlX3A==
X-Received: by 2002:a05:6102:38c7:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-78a4a99f93emr1432688137.12.1788524550801;
        Fri, 04 Sep 2026 05:22:30 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm1885075e0c.13.2026.09.04.05.22.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:22:29 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-745497ac8fcso251235137.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 05:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtMeiaNGg2TpDlU8LgRrFTkf9SNibyieKNxVKpMUtZEXf4UejwN1r4WnJdCRumbh70TRjZ6bybKQ0=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr1483195137.9.1788524549478; Fri, 04 Sep 2026
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
X-Gm-Features: AcwNN1VOyxrsSm03PmZn55Uovue1s6XEkpvSES0-J6cXzlUAe5_K8yXLbqCQsDU
Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> The list of allowed pinconf properties already includes input-enable and
> output-enable, but omits their -disable counterparts.
>
> Each pair controls the same bit. Where enable (set) is supported so is
> disable (clear).
>
> Add input-disable and output-disable to the list.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
