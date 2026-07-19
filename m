Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32626223DCE
	for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784465773; cv=none; b=h/v7ss2lzX8sCnQM0aEhUxpcqIOyR+SykKDNWeA2qnnpfJsTRQe5QuqKxUWSggQ3Fv5dUeN6//XUXbynQiwBxZS/mIUYUIW6iLM5gsPUeu5uiLHa3Oq9c7Ir7eKU1Ui9nKfrKYEM3C2+aYPyjaxxc4tTXk0Iyylbr2u2Gp71oMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784465773; c=relaxed/simple;
	bh=tbFY6fp4UldEdOFPWG5qshyGEZr0Xdq96AYMiaJs3fE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcNferwEFTkty5H7J5Wdj66IYpMBCraJpy9HmHa6RxIu2L5Jvqmg7bGHkqgCdx4byImRNrWIb9PrO65fSTOJIAjNlcUdEjPIvIZex4xCAKnMrmU6epzeduE4YMVQPFLLKyQd7P1MG8KOlv+07Tp9qrZP2aIMOQoVRGEzoBH2yWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtHDaHI7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtHDaHI7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso103264415ad.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465771; x=1785070571; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=WtHDaHI7id7Ol8OBwU8ZDSPcf3M2AOR6kkM1dVJlOSe7KXqLSOr++pRK3MhhjHwzU2
         wSTi7tdDmjtHMq4KkCXt073MDesghm+mFL2YkGFjYkK8F/z2OzV2/oqxWKkb4CInHQRB
         BlLIzRm0E54a7Q2K3WTiFg8Y/moaeVFNtG5z9WX2MMOzTSgEjUCd6KFICAOAYB9shFho
         mZw8RPnKcwPzliTQbwNnTAaSlvG2Wl1Darwh1NrKs56/a2y4DnSSJJGnCUSHFSnvMN3W
         3onfcyscIemqC9QqcO/CIVzBT7ZuDQGNwoRo3CehcXqEXPLPfPgN1UmMexwITuqicT34
         vkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465771; x=1785070571;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=M+5Is4Z29U4BYEbx4kDZw4Mpw4cVemFSe5FjnUGPbgXtkuG86+1R6l9rT4o6yG4z1y
         GIHr3JFZvSNxm03zMTPiiumsX7Z0AjEa/tijafR9W638wMIFF+VqNUJCCa2YmlC0NjcS
         +AWWs0/4sParIu9BaRzq+/ZsYezU4xY6PLzOYX2w/VnmmGvsrooVOxZgIy5kFKoT5JVk
         qQgyf/ITS1LYI0OyrCRMw0pyzWYWJOrqort8wjPJSJwM5+kwwSzVqrcpd20cWA3TwlE5
         ck37yd3Sat6/scIScnv5n66+GdnU9WwuKjXCoBeqXlXuxNGXcJo7aUFompYxLO1IWZQq
         3qcA==
X-Gm-Message-State: AOJu0YyCIA/DwJisZUhZUH+cW1fF8oLQyvWPoVgGFXWzgmXkIzlaA6gM
	/xwXFqhVzmJFXHS1Vl42kYOQWiK8Dz3ZC5xw5rOlFE8FwsZytqARHNWOUd1UTyU2
X-Gm-Gg: AfdE7cmeqH7bvfX9wVUkh/dq/fBJSGFsG1D2jj+mUUjqvKU7nUtDDOY49QROKtQ07Cx
	xv7bXnMtJbYbxBHvVUOg2++RNdZOG8Yo6SDT0dge8bPR/slrEUAzfInPkJG3BHr0cAAy/QhW78c
	jKNx4k9GAqa1VlWpnE61d9K9dO+Vu/bWzC9NPKQn2kfSQ2Ht+0nmWf0islyxF7S1eQedgvw/Fu5
	mJHq7+BCnjF8ysk9qCpnakbSicwzRyk8aCbKrJujXL26ywYzL1HBp+iyvPUApb8ZO8IoX/rbxhB
	eTHw6UGpEX/M6y0+TuficN5rS+kIOW/y5te98NodKM0JxYBG0vYhy5Xl0j+4ZN6HckhBSBr8Pnw
	Z3pB6+xn2UcDemvXXMRobOYK+6mDM1KACAc0E9HeIIYDZ+jAb9G745RUhS6wYXQoom7kpqM7Avp
	DEte0=
X-Received: by 2002:a17:902:da81:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2cf34a48064mr112928635ad.32.1784465771134;
        Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:10 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH 0/3] usb: Use %pe to print error pointers
Date: Sun, 19 Jul 2026 18:25:45 +0530
Message-Id: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHJXGoC/x3MQQqEMBAF0atIrw0YGY14FRGJ8c/YGw3dUQTx7
 hNcvkXVTQphKPXFTYKTlfctw5YFhdVvPxhesqmu6rZytjOHziYmmSAyRZ/CqkjGhWaxzcfNgKO
 cRsGXr3c7jM/zB/dGg0dmAAAA
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=1535;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=tbFY6fp4UldEdOFPWG5qshyGEZr0Xdq96AYMiaJs3fE=;
 b=AKmLrPfrqg8Co2eNp1+tUZNc8ZaIcc3Pvtn1ics7ne1WDLCCZGIYXPUI1ATsLWt53k64N9Qzg
 WbSIB/hP1e3CcRt9EbIhunGN2mAKRvXXd16B7GHliBKtoD87uKcy6tp
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

This patchset replaces PTR_ERR() in format strings with 
%pe format specifier across the USB subsystem. %pe prints 
symbolic error names (e.g., -ENOMEM) instead of 
raw numbers (e.g., -12), making error logs more readable. 
These patches fix coccinelle reported warning: "Consider 
using %pe to print PTR_ERR()" in usb subsystem.

The patches are grouped by subsystem:
  1/3 - chipidea
  2/3 - miscellaneous USB drivers
  3/3 - typec

All patches are compile-tested on x86_64. Please let me know if 
any more testing is needed for any patch. 

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
Subasri S (3):
      usb: chipidea: Use %pe to print error pointers
      usb: misc: Use %pe to print error pointers
      usb: typec: Use %pe to print error pointers

 drivers/usb/atm/usbatm.c               |  4 ++--
 drivers/usb/chipidea/ci_hdrc_imx.c     | 12 ++++++------
 drivers/usb/chipidea/core.c            |  4 ++--
 drivers/usb/core/hub.c                 |  4 ++--
 drivers/usb/dwc2/pci.c                 |  4 ++--
 drivers/usb/gadget/function/u_serial.c |  4 ++--
 drivers/usb/misc/usb3503.c             |  4 ++--
 drivers/usb/typec/mux/pi3usb30532.c    |  8 ++++----
 drivers/usb/typec/tcpm/tcpm.c          |  2 +-
 drivers/usb/typec/wusb3801.c           |  4 ++--
 10 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260718-usb-ptr_err_patchset-7c5d1547bee7

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

