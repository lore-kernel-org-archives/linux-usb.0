Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C8245FFDF
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783508; cv=none; b=l7r0GxxWV02rRejjCXz1dwSHWc0kQfc4aXecDCPrVaZvY3aiRNgzR1yW5GVKwNHQYUeFV7aqy+x4rVnkG+DTaqkI1nVd7kirPOGfDyx6Tv7LnJfFSrYrGXBUBQbpCODqjBS4AD1daCUP5OILF5QTEZE5n6aedxX5SwV8kYAfOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783508; c=relaxed/simple;
	bh=MkWGEFafuVF1/BklgAJXV0fN5ghDmV0dTjlZs4zA3sk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cHe/q3PXWVnQnlrW3APOoNaSZiFLI8cbQDpdzllBPXAVg7UPGrMwwyWDWXIJohAIvzwUla9ja3sWUz6/T1ajXqkMzi4BDY6CiD8oZLyePcHXvBPN1BZw5xDR0MRCk8BL5kYA000MlrBpBy8NDcyGPp5ofT+tnbN3VjzqhvT61II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogD1f6yn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogD1f6yn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so4597728a91.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783505; x=1789388305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M+HAsxQQxUDOt5N6zlO4MPtV29db2csxIdg6BsvV3Xg=;
        b=ogD1f6ynEvol+sKbjXJjQiLwbikJAoxQsJEF1rh89BiAgPW44T9zKmiLIPL0qbAPsA
         PMobPxc/zLbTs1X59QwdrFWTbAzYEBjVqgMgD2jXZIxgD2+G+XhHpxuioSUaBzYEPHeE
         iOnGnr9DNLJznhm9XeTm5lxfYyrZbHwUNkkVld3IYsH+a1q4twgLBbi7PH2aFUq1crjW
         1F4grt1qcjFdngg9B0ZDHazzfNHE8OWIqBw6BEj+HQFirFAKzJ55e/93Uo+DZhRXBxZL
         D5D4ET6EFmgOm1FNRKLSC4h55tFBWBoeycj/yfGVAeXYt15UOcqb2uHBCDplMtp7WoYY
         feqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783505; x=1789388305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M+HAsxQQxUDOt5N6zlO4MPtV29db2csxIdg6BsvV3Xg=;
        b=Llw1scl3onJ6R+T+X6sorhjwTaE+32MncA/jwrDu+pjF/33wPNa7cKjTSGWbPLzVza
         QYOwFOp6dn+5X9z4YE+UCXQaVDHeejhnyXneyGEiXNrMenB4E2ga8O2Eqrn+k1G+d6ev
         b16zH8tIXeQC9p9YwCVhyqv+1DwyCsYfeX2AwN7VGOLhkGdbqmpvJkSDI/+oxhGdlps+
         wBn8HeoBAMMrlOFHikzP8SBPdJXJrox/XyiwB898TYzGmqGBqhbiBbeU3bHYY4EOzgZg
         WvtHPAPENwzK+4TRoVd2SFn+YrQGxPXCZIor4Phw4+kaBkYQrVMx7N1N/Ea9N965PEUi
         n7Fw==
X-Gm-Message-State: AFuF++neW6yPfR4LAa+1p7gJhLhc0G0eMKHj6TNLo+nHzVDvyu/8L4tZ
	pujVXQ9KpiDlxaV1MBR2mZ6dwK0ql6XCnd8eUpcbwnlOVjbi79ZCB/GI
X-Gm-Gg: AYBFou2xGqXPOjXGxVNpS/4DpNz9Rd1z4dlOPZbVcBKHs5UDLzQSdBWi7BUlQG/nnyU
	DXBlkZwMViKbJFmpPQ+njgpYhZwZwPSN2rOVrjL7b5OD9Fv0v/mgLara3kuG95JgeV4m/Mpkun+
	q6kJi2GTahH82cV2EVbdj6TOOWD8ccGd6/vlW/x/KpxbQKhaZwXJn4BQz33hs/JNCyIePhQsbBb
	Hm63QVfnlGzMM6HbHYiO3+dygsjP4+N6aC+wlLa2yBI/Rjvv7zrVaFyNR2c6eWSjVAUl9KzdjP8
	aQ3sLX/vhV0xaMsfb5JWgQSepjnhqR/ZKOKOKYcnL3KHO9zf6Ovxe69uD+Uu6ZI8SYmXUtodwxT
	N25fxT9qPP6pikrCElBAvraYLGpROfMLuIft3uxVdv5l85sb3EyXZw2Kd62ZPIbNdmEciFJoMKa
	aaRg0Ur0PmXLhOVNBkcn58Peh/GOh6LqxUSGpHTeu+wCaJ3Yew5EEJgeVf3nSwOJejV0nkkOXG/
	VA65yo6jybBi1H0wIYSgTJ39kdysw==
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr39413109a91.0.1788783505530;
        Mon, 07 Sep 2026 05:18:25 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm26350223a91.1.2026.09.07.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:18:24 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] net: add USB CDC Ethernet NCSI support and fix
 unregister UAF
Date: Mon, 07 Sep 2026 20:15:54 +0800
Message-Id: <20260907-ncsi-over-usb-v1-0-6b74d2f1196c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqqnmoC/yXMTQ5AMBBA4avIrE1SP6lyFbGgBmNR0kEk4u6K5
 bd47wIhzyRQRRd4Olh4cQFJHIGdWjcSch8MqUq1KlWBzgrjcpDHXTrMqDB6yLXR1kBoVk8Dn9+
 vbn7L3s1kt3cC9/0AkTI383EAAAA=
X-Change-ID: 20260907-ncsi-over-usb-3e786f4686c8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Oliver Neukum <oliver@neukum.org>, 
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
 Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Mik Lin <Mik.Lin@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Adrian Ambrozewicz <aambrozewicz@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788783501; l=1794;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=MkWGEFafuVF1/BklgAJXV0fN5ghDmV0dTjlZs4zA3sk=;
 b=Fx16GO5ucEg/0bu7HbuHd3717YW/a0u4iihQVxPSlAPCpDP75sojVy1WFJ3tumaGE/oBfABNP
 DEktHDPO+5YD4JJ8XuKgvktiEceLa+zi6QTKXsCwoQCfrnMHOUJxTZR
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This series introduces NCSI (Network Controller Sideband Interface)
passthrough support for USB CDC Ethernet devices and fixes a
use-after-free race condition in the NCSI core unregistration path.

In DPU (Data Processing Unit) platforms such as the NVIDIA BlueField
series, the Baseboard Management Controller (BMC) communicates with the
host or DPU via a dedicated USB CDC Ethernet connection for out-of-band
management traffic.

Unlike traditional platform Ethernet devices where NCSI is initialized
statically at probe time, USB devices require dynamic lifecycle
management within ndo_open() and ndo_stop():

1. NCSI control packets share the USB data path, requiring the link
   carrier to remain enabled while the interface is up.
2. In USB drivers, usbnet_disconnect() invokes unregister_netdev()
   before unbind(). Performing NCSI registration in ndo_open() and
   cleanup in ndo_stop() ensures NCSI packet handlers are removed before
   netdevice teardown occurs.
3. Dynamic unregistration of NCSI devices revealed a race in the NCSI
   core: ncsi_unregister_dev() freed the ncsi_dev_priv structure while
   asynchronous request timers and workqueue items were still active.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Adrian Ambrozewicz (2):
      net: usb: cdc_ether: add NCSI passthrough support
      net/ncsi: fix use-after-free in ncsi_unregister_dev()

 drivers/net/usb/Kconfig     |  20 +++++
 drivers/net/usb/cdc_ether.c | 190 +++++++++++++++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-manage.c      |  19 +++++
 3 files changed, 228 insertions(+), 1 deletion(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260907-ncsi-over-usb-3e786f4686c8

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

