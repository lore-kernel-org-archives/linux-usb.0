Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276403B83FB
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350645; cv=none; b=mWb653V+7vPdVMrKEhHyU/58Lg0xNs/Zri7k6VGSlyb4d6kLzwuEEnQQDR1Psbc8NSC2kd2tseRFORY+Dlz74LCJoFakgW8e27o7uoGqXIbgQHTx7ex/x6w7lVrIVroI1xvvQWzMVYJtFtj+5yKdlUa6FxXl9wOdg+4P3CK3pjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350645; c=relaxed/simple;
	bh=BGVT6NiiPBGrDzAWTCenC1f6pOP4TmMvoz1BBe+v1UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlCROF7qopshPc63/ajqcQpuvdcl1L7dvITRDkeE1yv3eNJQG0qlDl1d7VO//u/jHwWYsYYn5e/9rua1MhcONSbplGblv4EKlDBitdpcdP/PLwzn9vbni9yCpoLc9npI0VflEM/Kk+GU/2YSi1SNASWSu/uIVhyKlPlEnxgETn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96723c7151eso275136241.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 05:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350630; x=1788955430;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZuEv2ob4j8Zh+WhkA/MTuPTTESwfEtjHWVWham0Lxc=;
        b=VvYlZydJig7OeXYHVKSUM5ia3AgChs9DcszVCMEBKJTTRH9NhS7RtjwQEw6/74mUsE
         ztB+4dhUrgpdqFV0iaAfqdd4iFlqQLpfZdeXztvSxzwYE9/4QMCa/YiftoA4VHISbXkj
         Gw99QWiesO1Lp6XR5x3crcas4NDjmF3W3vHw19H1nJQGOiuld5ed4FBI+cX3lgFdX4PK
         o5CPUYyo3i3eo/EkByvQi8/Jux9zELeYFCJ+sqk2H3zKlHbbijI0wfA/75OPqra4W7/s
         nHvbjWrE3ZqGEQS644X9JdbzYC+TqKRb7gb1sYLGpBCOdBMnS0Cmiz1dypTLpQ+n+50G
         WWlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiAfPzUH2GgCwoeRp2HMgzBBK918zsQslzxdXlaIo25mAjim8ZJcnn/g3knGGjwkdu3xKf4uV4nF4=@vger.kernel.org
X-Gm-Message-State: AFuF++k33NUBSXbswAHax2MVb3FtX2ueKc2y2IiZG6zMtM9g3zJlRdva
	oZbDoxZmbnajIv/tCcHE7WLJ2Hk41IRD0Nn+jhHmCMUWRzAVx09hviGp2Y5lfBwf
X-Gm-Gg: AYBFou3UNogXloojvqANz2fqSjGR/MPaowZ/61Q6VQhadmf4jfokoNsIMoiw9tDMPUK
	UFM2btWh+7FSdMqNeXK/g0gaywQvmR/RFHtppJM22n+j2E7rAKTGFzqPm+g0TIKoreTKSU8cRcS
	dAqmLxjlQ+fdYfceiv5KSerjX2bxBPFq5vRVzz1FeytanwEcBeIlavaxZN0Z0PS6d8lZBcOy9O8
	h5F1+RsdNhxOGQbjgaIR7JLXctFx5F7mB5nPSVHm7XddhIF+xj6UjqMnUAKKT1UPw5z/IkdneWs
	mh4p/3OW5XcUwrcjsa+2+CqADrtPYC5YTZcBVwiEfpOgWs3XRPeJXdYKCe5iwLlbV1ATnfgbRr/
	DZyTnyoM3V1MzcXImgOvHpjDasTlMO0NC+73fO0PKPHgYb1nuKBuKsBYxyp9JZLh+JTix1bsXEz
	iSctdhm8JhVTNbOEInoCNUUYNhCRrTb3gxj+cUTY3m0wZbkkYrIoq2x9G1aGkiUFYnvH1x+ItLA
	QHhW8Mjrb3Q4I+dsSCqbOQ0rv0ZFq6uZvPyUGBB
X-Received: by 2002:a05:6102:4495:b0:785:eb33:8794 with SMTP id ada2fe7eead31-78a1f352f3bmr1371377137.10.1788350629921;
        Wed, 02 Sep 2026 05:03:49 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a4b1143sm1879308137.7.2026.09.02.05.03.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso393690e0c.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 05:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJqDeYy8qlS/JWM28ef2wesvs6TqA1ZQU53tzce4EwBvSkpN6idNYleb1XjV+q67a1wE+yVGzus48=@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:784:94dd:5389 with SMTP id
 ada2fe7eead31-78a1f3954bfmr1187932137.13.1788350628203; Wed, 02 Sep 2026
 05:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7aL6kq2Ib0xjLGz4RQRE9m6dme2IHxODeY3IaF54CXwsKAcwLlCow_cY
Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
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

Hi Joshua,

On Wed, 2 Sept 2026 at 13:50, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.

Thanks for your series!

> Changes in v7:

Oops, subject says v4?
Fortunately b4 is not confused, and does The Right Thing(tm)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
