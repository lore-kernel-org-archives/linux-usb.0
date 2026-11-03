Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704906;
	b=fx3+f8ziEJUtnXqTEK5qugrkQTzoOaZlg2GdRVJlnazOBKw05UtgULEAJZv4ukdkX023
	 DOhSUsybT/zTtSoINReULh0S19Wq08xAfr6dnpWfBlXtiDhCPq+oR3nG4Ku7hvjQW9So2
	 MIdQOCZQ62KzERv2tZDPSxLuH1/dfVs3xgYkevY9cWBoNlsR1/sy5UxqRprpsEiPUP7Lf
	 K7u2kZ8a6MvJWYda7O6/10foEgQTdK5JNetpSAX4RuZ+wJv66u2Rs1lE/GA5slk07nfMU
	 3p8dlh2qe5vEMX3k3yzTQoOnlL1roSHVebViPigoKdY8RvwULiPxp5kv1J3X4AVEn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
	b=xfy4Ad7SqMi09/DpeHO28csWicYxBK9A28VnzOiLc34pqIwO45tFQyqONOPrA6tt0M3t
	 0SKI2/1OxlR973/QbWhJbpgU7Bw94wk73T+IMmsrDE01pLxsJBpR5bCDpIMHoazTJHBni
	 q5cK81IUaU7wpxeJ/fsRLNabEu0/VMyR0yan8xDOdezznN6o1VqEPTyJPeoxw1TM+Rswc
	 jCPiXJCYfNlNsDp8TZ3Hlymb9H3VmN6HXwZjQtlvLFs3qt0gX3iwqLWoT9wkISCr/8Cna
	 ipQjd1tbCWT3+bC+PLUd4MpWCrRouptbelAqnJfk4IzuueqO4AXslVMg6wHk2MVuOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BtpJFGEU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D18606B12B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D18606B12B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BtpJFGEU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so43100225e9.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704905; x=1794309705; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
        b=BtpJFGEUIfpmQFVgikXOyK8mpdxYTHLH/gETLZu8mAaLbc2hkHlDReg1Bb8ikP41cC
         zu0GbxPNSrpjUNowFKKYNtO+hxCwxRkBOWyfndBKSvL02UIHYx5KdHYIglteVoALumrY
         mRYjWF3gDM8n1bTMqdaVksYeXznIniRW7lVH94tFVwvDf/HJ7g1BbZdP3n7QBgsfq/Yy
         rAolir5At24XWFfZAnW4CNbyCpPhgH+f4okUBq4XgYg2l2N+J0/XQ1IKrEkd1IEqyp00
         IYLroDtzhVmD4CAlQ6OQR8QcVgT99HmgEGrqRjQNloppvZn+q/Nn6iFxthBs237S6JCz
         AQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704905; x=1794309705;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
        b=X8o4wM6C9Dw6z2SwBBmwoPTXtfJmO+8NZ8nYQxzysW77zvqe+pALR8/Ed8TNl3Ve0o
         rJeR+zFyH0hSPncf5RP2fnStQfNmVF6lYD7gsTzToGnjSRh9rgBXdyflWnhWRtYPFQdG
         K8XapaKlR7sTLuHH2zJ5qjQeKS+Y6jLj1K2WpO3sgkUDT/U6Gl7Sar/eAQy4QNxQEaaG
         cmVqe0FfaK7ybVNFugbwIjhwDpfrj64LrbSoRXr19ehfd0Ou6Bvgc6kSVAQG2lxpnhMX
         CRPUiDXYa8Kgg0V3iR78Mn/idDnJHZhKKZ2pcXlhRyQOBxNGjSM6YhVnAcMdIMn8XxKd
         tEmg==
X-Forwarded-Encrypted: i=1; AKwUvBzmZGEcfX5uddwEdtBK6Luh9eTBhW+1V361PgvA2qxKBBeNLSAj9/sZxRdiscGxr8OpyA2KGJ1g8gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YYwBQqTYeFbWWhl0fbe5nOYT3wfe1YSvjVRhmb3v/Q2aFBcbG
	unghmmp/zvqmZmW3eMmGNGeEUWgr104Qu+Foeh93G0aRsHynaALYKs97Nk7cw4WnnWw=
X-Gm-Gg: AYBFou3RilrjUqMyh3k+tcbqRYvr01iRo1VZDJRBhvKxUsUE/etkkkJqLkJNI60iz0d
	Siv97wdjCZ+xAODTvnB3wNguT1kBg2uiA6WpDlpbjF4j6hLjEYOe+TSE1RGjYjnRiB6XQ1MiHkv
	mMGMZRNuozTU8tVThBS7Nt+ENfbVQ+bkJqPptpL4PmVCaA0mvnWw0nVqIZYZFws4b9Zts3e2eso
	oFIngPm1llH8MD+LPtlT32nHfdiqvYZAtnvFopCwheJ9z0QACe24btlvGr/FgXNXZsTYJq0hGGJ
	Vzgx1UtW5Apfelu3blyuSkSwfQ+MxFwA8TPappOnsTYtW6+vDwMSGdBU8SpqO/PFRbKMfjzxv3/
	wtk49ZeEP9pMVgEDWHckVynIYlVxUl/MpC/LuFvMQ9z4p1iqhz72RSpd0RWvKXD5pnoYuL4e8Pt
	BiwxVYqqr4YV+Sl27ZEe4Qe/9yz+eDQ/jLoA9F2z6+TLxzzoUptvgw+n9ulUxBnWGwA9jmJYybX
	F92tG8PS/yLeNC4mKnqOETxQ3Yvu0qHn0YDxWGV/1lB3f2sHI9kdDvs9UchG+esAcnYFk9w/l/O
	bI0O9hy1+32XX5ZLMr0iYP9qMTEqiSMjslbux7YnGmA85kjZ6V3epcHRM7bTJgeWNv6wv8NU6/d
	XDcbRGL9Z2HVNxxvd+fnHXqqRJ7eUYVY=
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr321876635e9.6.1793704904615;
        Tue, 03 Nov 2026 03:21:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:44 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/5] usb: typec: cable comms on RT1711H-compatible TCPCs
 and FUSB302
Date: Tue, 03 Nov 2026 15:21:21 +0400
Message-Id: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm1CBwLGqxgXTP2RGgEzBWNCu
 LujLr/Fexs5ksHpVGyU8DK3ecqQQ0E6dNMNbNdsCmVoRMqKh9VjJcLaxQdY53HkuukD2ha1ypF
 y+Ezo7f2bni9/+xrv0OV7on3/AA9Begh2AAAA
X-Change-ID: 20261103-husb311-cable-comm-46f2e77e4c18
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=alchark@flipper.net;
 h=from:subject:message-id; bh=X0y23fFXZsiPBI8+tUywZO1MABrBc4xkzAM8hyoRHSs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PLzn45mK3N7WJUn2n6IvvmDpU/wnuUzLIWGnouOeZ
 8sM9KJlOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqmFMMf4X3/atwPnBS/7eW084Z9/XztzFHn1wn9Kzz6fT9E6eanDzIyLDqx8N
 Du6U8Jl9pt3S47WSSyefHKlnnlvTe0O6n/mz7E/wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Neither the RT1711H family (including the HUSB311 and ET7304) nor the
FUSB302 lets TCPM talk to cable plugs today, so cable discovery is
skipped, and with it the cable's current and speed ratings.

The RT1711H family handles SOP' like any other TCPCI-compliant TCPC, but
enabling it exposed a problem in the TCPCI core: it set SOP' in
RECEIVE_DETECT whenever the TCPC can talk to cables, regardless of who
sources VCONN. With the partner as the VCONN Source, the port then acks
and processes the partner's own traffic with the cable plug.

Patch 1 fixes a TCPM bug that cable communication on the FUSB302 made
visible: after a VCONN swap, a source resets the cable plug twice.
Patch 2 lets a TCPCI TCPC receive SOP' only while it sources VCONN,
which also affects the Maxim TCPCs, the only ones that enable SOP'
today. Patch 3 enables SOP' on the RT1711H family. Patches 4 and 5 add
SOP' to the FUSB302 driver, receiving it under the same VCONN rule.

Tested on an RK3576 EVB1 (HUSB311, source-only) and Flipper One boards
(FUSB302B):
- Without patch 2, a FUSB302 sink sent SOP' Discover Identity over a
  cable with no e-marker, so the HUSB311 had no VCONN to source. The
  HUSB311 acked each one and its TCPM answered over SOP, after which the
  sink soft reset the contract every time.
- With patch 2, the same messages went unacked and the HUSB311 port
  correctly ignored them.
- Over an e-marked 5A EPR cable, the HUSB311 sourced VCONN, read the
  cable identity and completed discovery, while the FUSB302 sink kept
  SOP' reception off.
- With a FUSB302 as source on the same cable, it sourced VCONN, read
  the cable identity and completed discovery. The cable plug accepted
  the FUSB302's automatic GoodCRC to its replies, which the datasheet
  leaves undocumented for SOP'.
- Between two FUSB302 ports on the same cable, VCONN swaps both ways
  moved SOP' reception along with VCONN, and each new VCONN Source
  soft reset the cable plug over SOP'. Without patch 1, the source did
  so twice.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (5):
      usb: typec: tcpm: Stop a source from repeating a cable Soft_Reset
      usb: typec: tcpci: Receive SOP' only while sourcing VCONN
      usb: typec: tcpci_rt1711h: Enable SOP' communication
      usb: typec: fusb302: Tell SOP' messages apart from SOP
      usb: typec: fusb302: Enable SOP' communication

 drivers/usb/typec/tcpm/fusb302.c       | 63 ++++++++++++++++++++++++++---
 drivers/usb/typec/tcpm/fusb302_reg.h   | 10 +++++
 drivers/usb/typec/tcpm/tcpci.c         | 72 +++++++++++++++++++++++-----------
 drivers/usb/typec/tcpm/tcpci_rt1711h.c |  1 +
 drivers/usb/typec/tcpm/tcpm.c          |  2 +
 5 files changed, 119 insertions(+), 29 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-husb311-cable-comm-46f2e77e4c18

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

