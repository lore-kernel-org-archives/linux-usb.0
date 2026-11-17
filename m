Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916990;
	b=lZLYCwwAtemMamivujAW1hBj3Ci29Hmvra5sLMQQA6R5S1mU+7kr/dTUtMYFok6YAV8a
	 +6im1dNH7eTamYo+fQaF5WcVbzcVzwCiQztm6ufwzuGIh9OZ2ENG6wUy+NGI9u8v0aXZi
	 8CzryIVPRjWwc0MMcT7Fg5m4MCWTwZRAZR2pghlandR2dkhPigdWd/VnQJTop4G3fp7l8
	 OnvVoGAjCdd3BvY8tQ/chdGRbP5KgZ3Vev4BL52J25dLNYqZYmHoYyREYx2kjXpkMZOHE
	 2Ohr31K+plPcnrapqKxUHaiRgBp/Ih5SIT2KxJA9wwoAgrEzSYCaLH6ygbEN0N+WwwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
	b=lyPh0CRZ2FwWY+26Ij10EPgNLN8KxXLimghLJU+Wa/gDotah/ltOj1h9McLZtlK910hs
	 AQxmEdAz5AsfAw0cOqMnFdRl6Igxn3cjhGDNwe9CXI+k+yo+L35juvHioHcvlPOwp4wVM
	 DOz/5icN1x1GoGqyHqZBUA2O0F1Ke4xMTn7ZrAKnRCijKPZP0wH7zrb0/906mJKBu32Vz
	 TzCNwBvoyeZLIek2/KuAempAHHOuKqPTlY1vWx9I+amqCAJx0vIXPeHHuWZgtrxEVY25c
	 zARIYl+6hImo1tS+Kjo/OT1VGAnGG+tf0PtSjmgqoL8GrzVDxoO3jyOJaxtruNPs6IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=UIuziyke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B14606A334
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B14606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=UIuziyke
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so6514014a12.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916988; cv=none;
        d=google.com; s=arc-20260327;
        b=bSDpvcRgu4zw9QxDBhWfBwsYugcp3t2O6v3O+Xej4sDqXLL/49bMYRcCyHERBZ4TCV
         wWIX4ww19Du598i85hhn3AScAmoHtFc3K/EakDS5K7U62im1XLZRZqaVuusavT45f6hz
         zajc/Kik94ycJsqIoW0RESoh/IQH0c+sIfwObH3TVg1Y42uQ90uR5/zNqk9TUGyKmnXE
         IJ4jcXBgit/XzoogmyZgLkQ44UBRF6zf0YX+9E4TccSxlpvbTs/I9GN2tT9EylX3HeEO
         TwVtzkFesD6KFlJnS+sRDLpJyRnRycmlBrlE56CKa8ZEMRGs4qUoxO4ff/mSq03HhmC9
         LwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=roTT9AUwF9uTEOcZ6epC5NZQ8e1w03pLpjh1NMcmCVg9TqqM01ErKdKfMVCabP5O3a
         /W/E6GcZFzzmrX00LrN8xgGeIt6uNJPvu9XJu3JGejWdoOTJG2PrAwvaFnWfMabTBJjc
         5506pfN9gfRroCbMInE5X6RyxZQq52oL/wDh04W27Pr6EesF3b3mUNcusZdRQqBaPTCJ
         /7as1HxFPIp+De5TKbVUuDu+1E0RFXep2GWEHbb+k0Os2URplWdD5wPBSrNzUGImE9Xu
         zAo2IrVx6geltQCR8jeNXtSVtDwd77HHE+SyIFB55ypFXQWyfxx3ZIK0IlQPNaG1uCTG
         r7pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794916988; x=1795521788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        b=UIuziykeO90MVOpgxMHpjeycVOPXmh3MtB5V3xbUXSlkcgaTnuayiL4mB//VctyXrv
         gQ4povHtfnj07nUCNE2duL24fg+c290IkeG6+qcvkMw1x4X1XCrFj+mqKi8uuHbcEcft
         OHsUrqxmtRLPMd2GkxbplF0bfypdLHIcMQrCAE8cYgYJbHqkMJ/zBCCAcysF1+gAlcFD
         Ow9/wtN30cLmPvfA/Rv8y+axyonT/BZwIZgJ+5Min6UagDvWgGzCoZG46mH1SHpqBM2d
         KzzeMxpGE09x4HAQ5vI4YmQNThk1zmYYuwBS7w+0cDBVAutTrw+lbNGTCH8BsA9rlY/h
         FFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916988; x=1795521788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        b=PQRvjqnwFUADpPrRTKvrv1TEw8N2M0kJGzJHFwHHmhMdJOeS9e8I2Bc4H9WfVgMUFX
         H9tlHcUD1D+Vgom0uEKtOD27nUucuxP35SPjUEgdY+rRFC4OrzUvGn7cxih/WoZF0wz7
         Xeewa4HXUkCHr73kr2HTBiaig6xVvXeijWYqwdo9n8UQOp1n6sMwXZ2nbYBTgAzXzESE
         +MXbmp+DvuXSbwYRVNePq66zt0b8qtrjdikTtrfb57ZGqO+00qW5GLjRsff61xcF5lTW
         rT5wUvQ1qvyLsSaLha8OKeth8ZDs/m8yxYqKqpenfqP33riqpPO+5i2vpwLHMazuKzN+
         IWyg==
X-Gm-Message-State: APuU4Z8lQo4QMmouK9PQTd5lSIjMfdBM2HNjZNwPIHSUwHlumN11OsHG
	VWo6CmPo/K4AkwHNPBlxAQoiiVYWywHZps0mN3PUEcIMGfsjBlyI//uW0L6J4gz0sXSY4YzP/if
	r0MLbJ8XOzzpxfCvqImgyx460i8/BFNND1tPfy1Urc4dHifU2g35m
X-Gm-Gg: AYBFou0ysHLxFDTxGmlwwLO8f5Y7piuCwZ3HxVwxWoUFi6N0zyrS7BrETzZ0Vu9DxBz
	e1dcVPCBT2L+kWjuIZNNDw4QEBsOmGHDBIYjilLws6Ll9JXJ3Ad/K4rR+0ioS/mPROOQuOfEEtF
	QWTdcgLUcveNrj73GqPJ/T1+U6+7FvsAkWuaJbJOhcC3N8WvRVBYiqZIH7TM32O9qx3JFE+UP/z
	1gy6kMp0BuVvBQQyzUryoV/7ywGjC9QYptjYgBgHVOAzf5pP7mbR8GbwyQaU93gUGwD3noGfGPr
	wm3OwWlB1AIcxsT5eJ9wHLIvCmFlrp7eYb/IwbEWAPRtF3ord7zfxEZAt97DIKEy6jIk+WFrB1X
	jJ8TyKT4Otlf3w2dryhRcGNkfp6u3bLGug4VkwJYVQcC/b0zYn9SmzBmzksEsU9fBBIlvxA==
X-Received: by 2002:a17:906:d54a:b0:c41:6de7:7dee with SMTP id
 a640c23a62f3a-c509614e905mr1090984866b.7.1794916988054; Tue, 17 Nov 2026
 04:03:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-2-c7e1543828c0@flipper.net> <sashiko-outbox-218715@kernel.org>
In-Reply-To: <sashiko-outbox-218715@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:02:56 +0400
X-Gm-Features: AclHuK8wGtfVQvqEUr0N2YldqpRd6FmVVBygTXEaaEX5dXpjW2si5VkbtUvlkok
Message-ID: <CAKTNdwGBHdoknewF80wVJdOs_oswEJHWF=UbZmZ9r1jU5NHyng@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] usb: typec: tcpm: cable NAK in tcpm_pd_svdm() skips partner
>   discovery
> - [Medium] usb: typec: tcpm: uncancelled VDM in SRC_VDM_IDENTITY_REQUEST
> - [Medium] usb: typec: tcpm: sink message in tcpm_pd_handle_msg()
>   strands port

These all look valid, I'll see how to address them in v2.

Best regards,
Alexey
