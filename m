Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645736;
	b=U12z1GBRAmaFJerf2s3PbJp74QVQNgrK1/i3cOUdqUusftF8NI6Ktu7qeKpeomKdmA4S
	 IjlHNTJ7bLCTYXs9CJ53H8kqXXbiNJsUIVpZUNvwkhMZD1fCpoBNVbfgg92IaKYfGTRhz
	 KFKI1QRlEUje6EDvRjwTI+VxMsSxfE4x5BTyh1s5gXR+kf71wie+vhecqm2xvR8CsfDwP
	 ndkzwcdmwaghrB2VI2oXScVaDbvQVkga+ut7hTkz3gH1RID/+2Y8n3gqPGQ/Gs55C733N
	 eF1Pq2jC4XGxsUDbvKg1+AySrjut3dMcnQDD7FeI6Bt4hcJarSuM0F2Itesshmd8b9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
	b=Mc/5xf3lnRkEMdczU+UPFNChhryn8k/hnBixgoQnKJw2fv4xuefp2uJ5Q7kZsZTprPwk
	 4/V/Ujhf4Z+Yh7rkTmzfHnI54wXcgOFNNeqmEv0woBV+rD/+dE/lA2mYPPyNod0Vfx22j
	 VJzu3TyY056Fqm+JneKpahrbnso55t/coQeU0KuVnpGrLDWsVucNiPI8xhNQooa+zVRDm
	 0S64gRxySxssAbgioYK/s5z0Ywzes00EWFtnI6LFWdw4Cyit0Q0E281mFlj0t0b6759oI
	 aG36O2U4ZWZGmdOOMXbvzd5SsYKVFMh0uA0qWBR7Me506bO39TQCjiCT79/IkEvHxZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QsmA+a3T;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCB606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QsmA+a3T
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso6836510eec.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645735; x=1796250535; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=QsmA+a3TL79/OwFEamU3b0vlvw0XNSzW0B0is2MtuGIg+SilAJ6tDWBJ+3mq/ZLmW0
         HST1smYjJjpYsEJfkFvReeABl6LUebKsHJsX4zOcPe9jB2MiVlC9Vt88gh9oj8y3HpqZ
         olZzE0Zi+AwFSJJB4xU6OOV7WjZIvRGKih7ELm9b4ZLh6WZe895YB+KNZdMUj3owK0H0
         i/kc0xAqHrcXMNO3xV6C/hisanGP0jQKA/LQANKkRaXOcI6gtff7uaoX+Vs1zcr1/Amw
         djv8ja1DHVtoW2wCWD3zzGRYkWt+TW7JBSQM3K82fZf+HOMVIn6gZaqX63QKlo9Bh5wG
         6Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645735; x=1796250535;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=jkJNjeIfwGH8veehMvLDib8E4cq8MhPwvQCiqTL+fdcNKMAqA7zARzDK3x3xRgSPn8
         91HhX0UGwoq+hXAZo0Qq5Uls4kvkD6BEVrm6LX52jflN0b18CZbdknqhhmYwAINKUAFH
         9gwwj3XZGiRarozYlRfL1eZbHeq8IqsYUXyeckIopjjJzaI7STuua+efKVJDkYQWLJuV
         3POiompkEOnyGHBtXOlahSCF8wRQ/sJdv+4OcVHeLpyIBUTNg2I1Ufz8OrOX4GG5oVrO
         rRzsuPPms3Rt+ufk3H/ofJAtI76KS7KJwUWZq6J4SWN5eeJVKNDDGugEmQrAJLXz9KQ6
         jePw==
X-Forwarded-Encrypted: i=1; AL+hErEbzyHUjAV5oX0c+YfefvMWHpk31UuRVC4Qx09vDfzSpquJ5nxq5ncN18BzFStiJGSCTsNNmvdgpmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l4s4YUVuEoXHBpeDZhzEyX0e+a5i+fb+/20uEw8jkKrxetE99
	ot9x9n9n5Ua9UDzGH9rvRzySZ/V4Mb3I2Fkye+/mQ5ayUb9uXO4KojmythSzmXZzq+r+cX8Vhcc
	4hg==
X-Received: from dybla7.prod.google.com ([2002:a05:7301:1a87:b0:381:610e:404b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50fa:b0:384:6487:b155
 with SMTP id 5a478bee46e88-38570c359d3mr21814023eec.29.1795645734570; Wed, 25
 Nov 2026 14:28:54 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-1-elkin@google.com>
Subject: [PATCH 0/2] usb: misc: usbio: fix fatal URB resubmission and probe
 maxpacket bounds
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  usb: misc: usbio: stop resubmitting bulk IN URB on fatal status
  usb: misc: usbio: validate endpoint maxpacket sizes in usbio_probe()

 drivers/usb/misc/usbio.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

