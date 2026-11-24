Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490964;
	b=tlJl9iPQveqM1+nSUca17Z7n9Co7CqVkI4yOVGYAj3nyXcw3TVxxP7qxF7Nwx+HlHqdZ
	 +4ay5EDzpHMd0kdWAngi4IOXnDqf6/sBjJa6BTfqQkbnU8D0atuSk9uQ72ug7hTnQxdRK
	 xD9YsZUln63lOcTsIlJ2DZrkatXT3r/PswKjDenPBjK67VwIDEehPi3s6h8Z1rleMlhzU
	 k2xm0chd5EcRyvxDajQZqxCMiyQ1cNRA7acP0y//Vq3WzGViprBr8lczxDwsfOTqukjYT
	 kRod2eejE/CknqDYxan2m80uenp589DR4/25jwnIRbHhVTaQ/V/jubMuezikxw4iLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
	b=Pb4mqkPJ5F60kamtTckgIrBTfFd5SLYqceLaObIrVfAlX97asmOcOkAQng2YJ1aV9Cec
	 7skAJ8ylP81EkodXDqEuXzRW+B6iucJjuuPMiYDRd5yydPiQ+ecddhvSlf0HlpP8TICXe
	 K622L+3jOHvnIOG6KvpnC3XUYOi7SVZOeDDHicNqvGk6iMuAxImY00QsN2JV7yMagEX+i
	 ZzkjsviC7jClOCUbACeQaGot5eRkcnaZrHv4d2rowrGuuasCfQKBwdj61ZuSsHlfFh4f1
	 +OQvyHJzaT7YwIRwHDTiQht/tLZyrAP1rs/18q/P1tqZ8EvMMe8IMaFnO2nGJcbLyKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F7S1iLJc;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D28606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F7S1iLJc
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55d03bfd477so47651911cf.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795490963; x=1796095763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
        b=F7S1iLJcY9sn/pB+Fwgqx3KER9FwyFv78AP1ATJU4Ee05brIci0Fc3l4aG2hFDwTd/
         wVDBNQEmwGJp1isvL3p+Own0Cih/IUGHbyFyQxp82a2hivSqN5HvFNYXsK2stFsZct3U
         +H6ezHSYA7Q0pX8Q2sIJYxSSblK3IwPC8ysD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490963; x=1796095763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/noZVJlmsVI/iK6NVyPbGiv8j3Ev2OolBCLP6YSdic=;
        b=mkBOpHkEoY+vfIonnVpDQgkep6TjRzNurkGoYUm3DjMepvpIDsL/w50aBZHw0EQ/eO
         3aahnJfIosqNzPfoCEKjIyfF5mb5wQIebb84IeTlVwtXCMTOb/KXCSPxWJcH08HcEakj
         GZp/cpdMuIMqI8nYrpi7CN9HkbloPQaEEIwQ5j+DmR2w2WgY/crYOyqp9sjuMRP4nfHm
         En2al/xDhzjVQS1wTFgg58dRhmOkEmK/K+yd/dLljqWkaTeylxsvdsy0GDvPK1cMw2xf
         xVw6hFQVVMkNE6VmaRRdmmn5qDB/Rc1tO1k/LHSjPfusA6EF7ClKtYns/MIcaitTJpvh
         gFeg==
X-Forwarded-Encrypted: i=1; AL+hErE1AN05WxlVZrRHSx9I5DdXSG3b7L/vvrEA15SGIsqw5UBn5I0dx9fvQOWfTVkdsy6BYZRmMN8JcQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x3I+W71CN8MgBHPZ5f90E+wElsFzp+oddWZutDpojX7UJJ4vs
	ue5zRUoc4c61wYDDtt90/190c81jn4BM4PM0+It1b19RneV5o7Dt+eQNiH8xR+shCTWWBi6vXjN
	FQDL4Kg==
X-Gm-Gg: AZFdTZes8Xuk5i7uFUYH7BBvpHTvQdQGSVIA6bdnx8m9J+WB2v7shLbX6/cpaECW16c
	1G2qfRmZlCHVveOKjdfvljDoBuAl1i8SB5lZYQTap78fomEkxDfpFtnZMStwrd+8RssjYWYeMoz
	Dhu2maVDalrSktHHGZdU/PgfeDVzaOt7WNltk19oMKW6csud5allDbNMKhYV2eDOEpxoDfU0FxC
	b8P4lMIb7kUpla/o/PMLCGCagz2OyclDBBHuU/G4MxYIck6SG5PMsI5mox4iqAqzXA0m+uHiZV9
	hbYY7Kh1nzOd+ApefuLxHGxZo3R38N55+DEQevB5Nmoik611HsxS1f1+knEckT0UHFBcuifgUjj
	KlfYHO6R2mL9PFaheADLgiGqIb6G37ZlucPnTvGU0U4Piqdn8WfxsJia+OEJWiOUbXYkIFmKo/p
	DF8rFbb38wmeP4rB4CDIMK0vpBkEJnCLNr3ighUt/L+AeWgcxAjCFmjaDt4VuZ+BkNfsJriUinH
	Nw3FF7SkpY8RdxCmIcfmFuKz3L1depls43bEGU3D7mkUnVCoR3oxZXHRaMLK6iSD23TpIFHre5Q
	I6jDZXBrlKaPybfYIG2Yj9O8lA2sKqBfhaZRpwgDVhkJGRxzxz53dvOOefIjhULXYmcSF487wqb
	wVDLbAHj9iFj5ie3BiLXH
X-Received: by 2002:a05:622a:17ce:b0:55d:99e:822f with SMTP id d75a77b69052e-55d76a8a94cmr249136811cf.46.1795490963222;
        Mon, 23 Nov 2026 19:29:23 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a1d948sm122126316d6.40.2026.11.23.19.29.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:29:22 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55be673e029so632741cf.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:29:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFmhIIHT+Ib1+amJx5ZIMz1wxwgA5yObYB91wUq5D4g6IzLqWLRYLqpb+2q/UPxRsC5AU0SViL0BiU=@vger.kernel.org
X-Received: by 2002:a05:622a:5c13:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d88102d7dmr47531361cf.3.1795490961146; Mon, 23 Nov 2026
 19:29:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com> <179543717277.3294.8933849621988482320@kernel.org>
In-Reply-To: <179543717277.3294.8933849621988482320@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 24 Nov 2026 11:28:44 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+XYDiiap9B4zp5u8kWYaV=qWvMXTBsHx-fo891MqzG8w@mail.gmail.com>
X-Gm-Features: Aa3M54roZgMs-31Co-jYLCIyN1rqgJ_7jaKMyLPccBs7cNuAnlExCnyWbIF5VTo
Message-ID: <CAHc4DN+XYDiiap9B4zp5u8kWYaV=qWvMXTBsHx-fo891MqzG8w@mail.gmail.com>
Subject: Re: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
To: netdev-bot+sinfo@kernel.org
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, hayeswang <hayeswang@realtek.com>, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:32=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The deadlock was hit during suspend testing on real hardware, on arm64
devices running a 6.12-based kernel. A device was put to sleep
(suspend-to-idle) and a USB-C monitor was then unplugged. The r8152
adapter is on the USB hub that disconnects along with the monitor.
The device could not be woken up in 2 of 10 attempts, and both devices
that were tried showed it.
With the patch applied to that 6.12-based kernel, 50 cycles of the same
sequence on a device that had reproduced the deadlock showed no failures.

Regards,
Hsin-Te
