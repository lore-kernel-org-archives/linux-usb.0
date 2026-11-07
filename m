Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011731;
	b=EyCdLxLvXrNZJOce45FRvYhFu0HHtKDTt2D2f5hAJfdljFAKdIvmIBNF/GsRlVHbAE/A
	 vEdtr1E5T/kzmRlsk4PVIQfQzigCoBVbGBFDR54XybNXgFDXQT1ACt3STN/N4j7dDU8Aa
	 btssoNXNcrEtNUhTanlZNm5ivs+ObTIkmm+0LYWoWlFzs0uGsrEazK3Pn5FXgH88Yw9kJ
	 fh+rGsyS701AaWj65JB4p4CBfL2pzXPsLByO63AESoH0vjbzZ3hQwJKLTcMFUbXpZqMKv
	 COn/yuU5/8ZLHQGN8hTKaAKc7hSORWZhqynR/i7a1KVY00nqinBTGR9fyLkXqGeWEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011731;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
	b=BGOIOvY0EX+k0H6SOhL3n1ogq9Gpl8zEi6Hvb/sDCpsdApEfbpadUiHl/8SG72XhrVol
	 sxBBY/Bdc7iExNFRgL8FClc4CpQf+bnGBgEjn8XuNDIM6BsCW/F+D4Lmhkaz6upbwX4hj
	 LuWV1YD1gO7w39PJP2n9NMBJDUxlAPZzhdMmay/UQ+EBUXaJpxH+9RXrWN0ExTo3celCv
	 TRASNn/Z/28rF63qj30kjH5FqRdE9Cq0AfoqeMwgCqRfWX3SGTafyQCTPLREKcRARoefR
	 t5BVML57+3U3GklKGcm/yjx2NoIQ8YUfAdlpUxrOQJDyWjH1lNlywNhOT+v+dVpi+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+nRxm2C;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Exm4AlYm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289F606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B289F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+nRxm2C;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Exm4AlYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
	b=L+nRxm2CdsZjDDLfOiM3rw6JQ2YSkFMIvrmpYPMZjS84C3zqbxjW61Ov4CHinq/8Z9Ed7F
	p7lG9WubYfUP83O+uFRnNVIki9rHguw5OoMUUOdBRpt/ZEwMBQEEHnj3Jdjq/4hm5x8Lnz
	scGozOfaPzmDEO9fZV6zsNhh4r3/6/Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-83jCe3K1PkmfHA6rMTBuAA-1; Fri, 06 Nov 2026 19:35:28 -0500
X-MC-Unique: 83jCe3K1PkmfHA6rMTBuAA-1
X-Mimecast-MFC-AGG-ID: 83jCe3K1PkmfHA6rMTBuAA_1794011728
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea053ef90so23073736d6.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 16:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011728; x=1794616528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
        b=Exm4AlYmuHbd8sGxG8TGS2gsdPsAltBSXAI/mxfKHuusHm0GrNdorHi4h2bo/S7ce3
         XxIOc4uHWeaxREHTI9At9kvm7lNqBC8HiYgUSALvuF4Qm/GUk7woA/lZVPxro2wZlD9E
         I8govdx8ZdhLiN5zRaJvfsuJHODsDVELU78Aa+wFjgGhZAO/D6O+ri0p8zqk5B/9Qtu0
         Ty6wRDu5EvFGB5x4AeaCYn9UubHBgwbElk19OkzqP5xXgXSDCwMD8aQedtUjXxhdxrMa
         qFIPVyViyXYyBqUlJNew8egUhG9u/atPlXyYXdz8IO63en2EOPBo+UV9HzQ1SG30hvym
         o6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011728; x=1794616528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
        b=ulM2bJlMQdaRK3yPiS+EkOWSiJTxRpzQ9Zcta1G/YQKuNZARrwpyA3tlnmsAoi/9Fs
         VW+ldOD6amI2WCAGMBQAiid/6FkkmfFvqMtjno0xFW5K9WAs7K9PLMHW8yHoA3nuZLbS
         kYqQUBlWBKdbN+CWhtBsXhze7Ie2pnmAlNj7jVAkA2funyeIjHT72JhYVaNvtZFhWhcj
         KVNyEaoP2xzRlDeB1q4GWUdU+eU6QFCJ/x0SkV0ZGErbcvIGU4+0Vit2ucAkll7FCDDZ
         2yHKLqt1+APsme9E9l8QYHxJpy9Kuwu9wvfKU2ETR+3yWltJso/C9bvT/ZxVwG8eBnlK
         2pCQ==
X-Gm-Message-State: APuU4Z/i5yWJJP0RAe1acdnht66zm8Ve2mUUayZakm9Qt+VixV9WS8fd
	Db67/7dFcUO6EAd4+Efmvn2+ymZ7ek4U7jom67K9vubjRQ5INpnrAE4tACIis3dJw3+0DxJLgHd
	LPZySEeOfGE93IgqB9yM3iHwZ7PAWB3FcGvcYevfuhUPWkfyKivi9myEvjV+1DA==
X-Gm-Gg: AYBFou3kOeOjwgnki/YEzQeXL7MWP9Spw6+nRCQNzyz79qyc9sGt6QyeHBCkw5u4Blr
	Tx/QUBc+IZC1DRllNJssNEy2bhgAZp0wqIXd8c5PZbGafl3FJdfZdB5ax4ddBQZ7c6bfbKodj8y
	3tMgWqE18wHRHODIUT2Bw1eM0wX629i+RS3Q+RQMXGtUP29BcVJmHVyqYCrcrODud9GRO3qIBTQ
	AoMeGC1G0Lbsn+bHsYuiKv7I2mmWiruP7icLkF+I+m5xBRa9LNf6KKRCNbTlji3sQ9Q1I7WH3+W
	90TBJX9NODDarJZOTItT88IiAorGhSfXc04Y/bIJ0lVrZlnBybRsQzLeUE0MAIfm+Ikpj2gQ6pO
	V4Un/FzAXV8qIktpc+KKjt3tuD4RQXJv55naLfjH/la25/iDnrTqMBSyItCA6NkZ3dSIoqxtfZk
	QVZ9hhfFK3lmr/4am6
X-Received: by 2002:a05:6214:21e7:b0:917:942d:f597 with SMTP id 6a1803df08f44-91ea96216c5mr59222946d6.12.1794011727916;
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
X-Received: by 2002:a05:6214:21e7:b0:917:942d:f597 with SMTP id 6a1803df08f44-91ea96216c5mr59222696d6.12.1794011727405;
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] usb: phy: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:35:11 -0500
Message-Id: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4as0s9ZEpWnKVcRCdTAWJR2EiLsrl
 l/y3n8BYyRkqMQFEXdimkOCygR0YxsGlOSTocgLo1Ru5MZO8ub4ZGl7rZwvtdGthXRYIvZ0fLG
 6+Z2WE3brW4D7fgAvZvcJbgAAAA==
X-Change-ID: 20261106-usb-subsys-8f41bd9464a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=841; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yk6LNvtf3ULASyxI6ekyKd4jXFpRSV0rSCDucsgDTMo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbneffKraLkc+7J7nlxnMnprHt9xk5tiNol38oJoP
 dEVPB5BHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyExZGR4eC06os6xpOnzpsk
 lqP59KyrhtFDQxvrfU9W6q/SPrToUSYjQ/vXMCutO7+7uRb9qjC8OFls+kSD4Jt2LBUHCvfInw+
 8yAsA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      usb: phy: generic: convert to subsys_platform_driver()
      usb: phy: phy-ab8500-usb: convert to subsys_platform_driver()
      usb: phy: twl6030: convert to subsys_platform_driver()

 drivers/usb/phy/phy-ab8500-usb.c  | 12 +-----------
 drivers/usb/phy/phy-generic.c     | 12 +-----------
 drivers/usb/phy/phy-twl6030-usb.c | 12 +-----------
 3 files changed, 3 insertions(+), 33 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-usb-subsys-8f41bd9464a8

Best regards,
--  
Brian Masney <bmasney@redhat.com>

