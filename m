Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IWvLOS+o"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD3E131
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 10:53:27 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b472f99a0so18584305e9.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 10:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701197605; x=1701802405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHog2PoF+PrI2ROThVE0vCKLJ47MxbzQfCwNy5d6t08=;
        b=IWvLOS+onzppotWn1wA0SS7ke6LTU0oQ/AKMEG0On0Rr7WtEbj3D/0ZAc12HVlekDl
         7SRZU5ovX1wONW3fWtsk0atTrjRqXfPIcmMw4jBtLJ5GyW2rts43MgFxdUbW/GbeRBiK
         zDXFA11sU9kxx9WK+F5JweiE56O66VkE7eezZBs1a4W7fOwM/oqk/B4aSkBcTgH0gsXO
         gsPhpDSG00x7PUr0T1ZqI1alOrE04YmG1MW2S+nisgLoHPN7OX07WG+ndaAbNzo35wrF
         SuKhhef6DcEOtCMJVm169rsp7Ra9jRYoDFyTas3LagQMOru8pwXzHhwLGGUD3PnrLHNX
         FUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701197605; x=1701802405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHog2PoF+PrI2ROThVE0vCKLJ47MxbzQfCwNy5d6t08=;
        b=orP43dsucWuL3xgSkOSWE5Yu+r1RyflBQ3v8JMtWxjBQOgX5URLgWev5VOztSDU/cp
         sjtNzy66YTPq6bJHLz+ArFl68eVlbwAUgEHFZ2xaQ/rOM5oxTNhgcPL7LP/wsjENkV9S
         J97DYTkXg6EkZ6TKtVkq9NWWo53GlKqXrld+pdHwzP+cdybnD+GSnYM3djg0YXyPLLFL
         miPRn8JCRhRFqDJkTo82IaNY5inAnYRvYnTQb2v0TjoeO7Aue1Rbo28uf1BAR8lAfskN
         EVa09+s1t5NNuchhji4V4YMSzThYQLVFnjkEouDp5VQf+n8yvYswjh4+qQCAVud7Ftdq
         XnTQ==
X-Gm-Message-State: AOJu0YypfZD+SKEy/RGgqW1jPoa27U3feYsmEascROtZbSUslfuOBw5/
	OsDVTjkdtkD8KjD6wWKHM+BPI2ppXALTC9CGDLemNw==
X-Google-Smtp-Source: AGHT+IEQGVz0XCq3tzX/XQMDDIf2TV1S2jWs5RJaMNm2tBGDFtKdXoxwgJ2TgLm29KWYAv0mW+7nKSqfB9vozofENNw=
X-Received: by 2002:a5d:4f03:0:b0:31a:d4e4:4f63 with SMTP id
 c3-20020a5d4f03000000b0031ad4e44f63mr9772881wru.18.1701197605305; Tue, 28 Nov
 2023 10:53:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127220047.2199234-1-royluo@google.com> <2023112827-repent-broadband-e557@gregkh>
In-Reply-To: <2023112827-repent-broadband-e557@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 28 Nov 2023 10:52:49 -0800
Message-ID: <CA+zupgxfxaB_bO51ZXW+5T3-FMF94=Tm+mqZ92LCYBZtwiQd3A@mail.gmail.com>
Subject: Re: [PATCH v2] USB: gadget: core: adjust uevent timing on gadget unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com, 
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 12:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

I don't see a need for this patch to go into stable kernels after
reviewing Documentation/process/stable-kernel-rules.rst, please let me
know if you think otherwise.

Thanks,
Roy
