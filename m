Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A319644B
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900337; cv=pass; b=RmIz82RMZAPX5XTMq7/yQiVC4FyVf3AjUo9z1wDUhDLfwY1oKAHZlaan5aphE4QpZYc8pPx96Gcj/vy47KD8LGDaypV7F4nVf0qMBn7bDSp5gycY4v6R9T477qXtRaiIVMUFf8JG4ToVofujDwrQ+AOcfvGTbIhxPlREUqhOhUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900337; c=relaxed/simple;
	bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoE+vUdgUAuS9ZhdsZRraLFQHCwFz/FRHnXJdAZmouELWvVnv/YYi3EdlzYmLMZtDGEaAoPqHI2Tm1xAH5GXxT0IB0xm8Zmr9PIbWevU+y27qyaggTF4yN0hC9RaVkrkRQKS47BnJQWC0XCKZ/HSB5Gha5/+96Dqew/WpRg4xZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWC/RRiK; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWC/RRiK"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so6575149e87.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900334; cv=none;
        d=google.com; s=arc-20260327;
        b=WMVl/JUeDTsyfNDhUD0ED25PjSBbWBJq5SHa5fw1ic+v2Oir9/FEvo6faALbNE0L2A
         ZPgHKPQwSzU2YF+NhENaQ+GXEX3c+9YN+XyfkzNLSSFlV7x0FYUo+axr7s/s1gmZbV0W
         qotgDsb4KPA7qxPlaf5to3QjE3y19X1jSo7IJ/IXOWDcm4L6a6uu3lduExKf6Iqh60Gg
         6cuUj7QQiwImp+bEhqGsJetPxS28jtvJ/mBohlCNXRWwHqpO3++5hUsTVkJyN6Rx77RT
         HAJhNbgp3gti9wRsbv50zHYYzlWSOrcQ9r+EflZN7hd9l03bffbWXqwgSQGL5SsyTSg/
         gr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        fh=yCcDxvJ/gMQz4apRQT8qXWDL78+VFDNVjOW8qKPvkqw=;
        b=PMGHetJJCUjwPNTkdH6SXUJsk1nCVpR0zjmk6l9e28XHHDn1cN39URTFRLBozuckH3
         SFkfCKkBxMKBZBSmhjVDMf5vBihACGI6AH67bhS1bPaGxg9iCd38sphr+a6pmwu5bB6Z
         LqYn7AOdGkMjw37R90tcSiJQQCTGxBEou6Hhky1L9/3e8J3waDfdok0HsadoRXrVKTK5
         pBAAj2pUs1xkI1mNzb5psWI5qh1MfVUnxIdo1CNPxMHxp44O05Rd1fw9WIpd6uKFX4zk
         RtuTbz+6XFZS1yHv2pnU5hypW0FGiatBM+WDxxbIPtbNKwO3SnsK3MjCqX9nBeeC9m5E
         2jwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900334; x=1792505134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        b=gWC/RRiK3XSy/RBiHcqO5qCNdVluUp8YFoij0XGNbpAAr5UAcI0S9LD9KHbVk9jDwQ
         JibuL/gigS9yYYjEOTJP8xNKd8p1h+v0RnaHgCwfof7XllJM8ThaA4FqIg3DCuR4a9mc
         i4N52JQR4bIbd7IoEP9NG7GAbcEtpmCyIgfbvkaJXAp8WZ10cCxGFcVFY6d/J1wjdEY2
         LIDuTMIdP4mudKatP8V3RA9aM2WvLTktMxsyvS6noUuKv7Wj9P0LZ2owWvwCDv5CEujJ
         akrQcEPSr9aDT06OTiTwkNwEebj72HFyU4AekJuL57pbG6qvcLzozoAgmssy01rrW1qA
         Kmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900334; x=1792505134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        b=sQkYAanmd8PzQkprUi/zD8kPoztkLWNcKWSu1x0aBu+zjqYsMeSMb9e0r5axxyljtW
         5EtXKzZ1Q2HK7n0giN1INzrLsH0VkceNTAOF3Bqueqn9vojn+AlS/Vn20mCQYeXnZK0Y
         AF6+X5qSV2+9GJGRnd+vQzovH6DKgiq/TGRz3S4K/llERrG6luuCMM5P8PHsoO+pseTU
         fgor6xEedpw7jblrNXfXTeKf32lkvkcr/EbCMqY2wc9LeDSvO0Dwf32RAcSvZqW4pJMp
         wtRKDaWTUTMUEsPMivnXckHosHtQ3bI+6zPZw7SiUqjaO8MUbuMnVYtH8O/KSZhUN9IG
         w4EA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ1AAfIlhqmQBUpbVDm51Cc58V7Ld4dc70W9luAWV7aEqOnJIQD/R0iQu5gkT+XUarlgOj5tOHycc=@vger.kernel.org
X-Gm-Message-State: AFq9FYImYXW6M7W7P8lSjznv0N9K/t1k2X5ehTiE+e0jFRkl+k1LVHe4
	P8V9CfBu7/wV4DzA7mTALbjVxXKJp4ltxi3nVm+6BGORS58E7ApfbkAoam0Uf3J9854Tg0SfDyv
	1kIrQoLqgh2FWmnwucItzdJqkbVqrRVM=
X-Gm-Gg: AYBFou2XXrQo3OLfO5f7kMTPZPInYDHHiS5RNj9GjEyr0iSzQLIfODPJdzj1AiEgGmY
	0VEeAnWgfJbJOFobCas8ET9GeQPhKiyTKO9KF249K7kSuUrwUafRFQv2PENG8baliU6zAMlXMki
	Mr4jyb8fe0sxQ/TT1zJR8vYEkTLUMB3baTi+qjhjPQFzrc2hks0lzCwyjIZHSXjmYqeXKpEqetO
	1pfcPvoX+3OCn89A8WvD6q+6jNbo2ZurKwRMJEZd2xzvZuxSEnCl+78SmoUox/yJ+sSRIf8ScID
	QP6bRfMZBWJWy3J/z10swunt+q39NVIWFUnuT0LX6S6m4uiYUhSu6M8unLwiuVrWRDKf28+dpLp
	fu5XrkjKhedUJwr1cw4kEwJeQWy8ZOyV+n4noD/gMtLAjlJkn9/p2meg=
X-Received: by 2002:a05:651c:19a5:b0:3a7:64cc:1a25 with SMTP id
 38308e7fff4ca-3a9c4ebccaemr28657931fa.2.1791900334227; Tue, 13 Oct 2026
 07:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009125154.266435-1-festevam@gmail.com> <20261011083213.1486acaa.michal.pecio@gmail.com>
In-Reply-To: <20261011083213.1486acaa.michal.pecio@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Oct 2026 11:05:22 -0300
X-Gm-Features: AclHuK8nY-5t1j9xNJKObEZJmJAKXbcMCglGOgF53Mzkc0EVV19cWoVGf2_AYx8
Message-ID: <CAOMZO5ALdAyQvPf+40=EnTDndSijkQvZw8r3jbiiwHATyfZN6A@mail.gmail.com>
Subject: Re: [PATCH v3] usb: xhci-pci: Add TUSB73x0 definitions
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, bhelgaas@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Babu Moger <babu.moger@oracle.com>, 
	Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:32=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:

> You mentioned working with TUSB7340 before. Was there any board
> firmware involved which made use of this chip before the OS?

I used a TUSB7320 on an i.MX95-based board, and used the TUSB7320 only
in Linux, not in the bootloader.
