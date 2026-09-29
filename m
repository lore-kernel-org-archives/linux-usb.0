Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB504B4873
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672500; cv=none; b=Gj6fQJc89wRX+DZS6R2nda1UtNAXvXf5sdaGC828j8Gzf2vcYjv95EY5wgCXQuhdIGgQ0KyTv074Z2H8xQD7CVXQDzr2ZiMZvPIH0nRtNpXMJaFdEMox61MdaQqufTAhsXBz7IqKNFVFQyzxq/I8/d4Q8gsK1f0yzLlcHg+bP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672500; c=relaxed/simple;
	bh=yGRUq+NkeA2wCzaT3ddrS1lhHL4f/8v2x/N+ptJUPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVKxict4EKxfKxIGmgnDcgTY+jPUAxuCggPRaiZXOHr1Kul12A69wK6hfFUNWnNEN8TpX4r7h+NNfELutu7wBEWsmRl+ryFOCToQs7npyQ+x1+86+5ObTcUt09cWvjLniBTeyGBnFw1tEg4fx/5G+YFeccQ/hnSuQkk0xITISrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5d3dc9b7f45so29094e0c.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672497; x=1791277297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M48abSoMOPLnpPLpLH2wH9c2xeQ/JgdDngp0dUmsb3o=;
        b=XqN+9ImAmltiTwbGQDPB+aBWLBqXt5e/Ndw4+bnV7KPCoJIpe+1XKLKx6E+ec8jb/Q
         BZtNEr+5cxt/RJCScsSnv77l1nyD2EBhEpQtg+7AVwmJAnYnCCtKMRSuWqMbAkFachdD
         sVoQs8kVYzOyt1pEstPWzm2Xu2DZS+5y3Ricdjr50jOQKumQPNPuVIwUt35oHcHAjSDB
         4sYhuOMRyBYaHM4Zq19gaRAkkagn0SU4HJNIH+qsuqr1AnnfiiN6sv8pXDMBwPzs1R8B
         ueRGI15BHw5AnGYLn4k4HIxuTlag8lT33h8hiL1tuHvtV2Ld7D17dgSuLPv3ti9NRp3W
         vEyg==
X-Forwarded-Encrypted: i=1; AKwUvBxFVnl6g8vVd//fES2A55oIJSWi1hJ/1TqlV8Hm7o+HDL752kMUupGJUVk+XpuQ18PnYmL6+F6bSkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLziYZzzf2OBM/LoCsoIQ/1Cpo58zb4UVUvVAanlGXB2OeBM/m+
	IHNf2mrLHM0lPlQIkm0uVI6DCb541miNgWSs5GAb7GijEESOM5Us0U7C3P3TkXD00Tw=
X-Gm-Gg: AYBFou2h+Y9UWdFENf0F0oVoMPyBHfJzNWzk5B9jtTFJf/nKQHSVarAlBils4H3bpNp
	YH43WdfcKbtD3XssrDQDB4oHi+urpibDzVslsP/GtHi3zS584Fk2D5sFFxXm/D2TNfDBzPxMUPs
	2rggeUqYG5PGuxGyrHS5Mnt/lifP9KhkdueVgeZm3dmoiQM3ZgFh2afyJ5P/rveyfVk/Xj90tIS
	Kge3VX2sJABfSlbcRsTsVcbamiRDUFzhk1FczZHfqhCk9MGR6ycZhGG7ZU53hJxYaZHCZcZpW6y
	FZlETaeiJrC2gHoKVGi81kl6L6vhAV5vRfmP8jhnMAKP2Y3QmfdfIy2ucWqU99dza42jP9as731
	dJBiFZDj7xVIqGaFCDLab0MGWmRqE7fRovFrtGqqi2ECj3POCoGT6rVGzAS4DlcQIuR71kTjfMe
	U2ByA1z856Cc43jJctaYYrmH53LgpX/3oDzgFo4JPpSlBeKqdfj+U55hW4/9rfjZHYaZK9nAW7P
	TVzua5eBJxXiXR0Qa/3MoG4Asjk1YxLBPTxwBne64FRTkE=
X-Received: by 2002:a05:6122:da0:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5cb0b19e6e5mr6966557e0c.13.1790672497552;
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b227ac2sm10455595241.13.2026.09.29.02.01.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b3acd242adso691917137.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 02:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEgDGUZvM+olNl4pB4JHOd2+iFinKMpG8MrQx5sENkpFBfWduU3ZA/Cz3w1PxyvYZe0xVL8D5n0O8=@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr5405907137.0.1790672496458; Tue, 29 Sep 2026
 02:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:01:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
X-Gm-Features: AclHuK98mw98nJ3_l_Mt7cVTGbvizjI_Q30Ugi6pttPN_xWKMIDQnQGX1HfBaig
Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> > Add support for a variety of SolidRun RZ/G2 based SoMs and both
> > HummingBoard IIoT and HummingBoard Ripple Evaluation boards.
>
> Thanks, will queue in renesas-devel for v7.4.

Except for:

  - dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
    Already queued in renesas-pinctrl for v7.4

  - dt-bindings: usb: cypress,hx3: make peer-hub property optional

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
