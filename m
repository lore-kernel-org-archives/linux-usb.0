Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E563E276E
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095991; cv=none; b=epv9SlHgP21FCy9RkCHtzA9oIMyfRli1eys7SRFs8XgzfJfpGPSxyOaUrrKMb7ozKFfCARVetxaNrL1oerfq6+mi0NCH9Bxvybvfssuyx35VVkMEaLerWYvok0g4RcKjEz0DlHNYAnen0bMKyjnRqLQqzTUjxKd6vl9n6s6oSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095991; c=relaxed/simple;
	bh=q9VUQOZc7igKVUlDqXMS1C5MbNEcFbe/1Ks/pdhU0os=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hR++Jt/qPJ3BBBdeDafZYuJU+65bPhH5UCkpBB3pa9QqP4QP7SttigzQppaXeYa5TsRdGxp7bIQ+ajQ747idX1cV+BmmiYEY6xAZ3W1xGtv1qIP8XrZqKAXvYmp8gAbrPmqLvoeV7orb7OwTfARLdhAm0MAbgdZLVPuLpT5U7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=boZERJEE; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=boZERJEE; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="boZERJEE";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="boZERJEE"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1779095986;
	bh=4S83+LY0nVHGep6B5D3Wsm04EAk92RsKtDHrzpnfk54=; l=607;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=boZERJEE9TI9oqREuvbZ9OPE8WrXYzL3afKIleED/Il3+kGQ7EBNpt1eD1ME0dLel
	 kCrKAwmhkatOJ7fZzhJqP4h7s2RGlyp+26/q6M0agnqLP+CrQdDkGvPJkZjk5UoA7u
	 f0Qbk8UAFjsMI0lAnkp18UhnBw9cPXZhZTaAQQi24knzLzVOEKcYEpZ0pFoRYy7SP9
	 uuAClIliDbpENsNhdFz35xnFSvK7JTfr2IBkbHfQVQ9XtCHifmXgXtvmoSCz4Nh6AP
	 7flMKgglLCZBx1hIX0vTnhyVl3W2QUyH/N2Q079vUsNqmgIfvDyitAPE2+DnYZ+el7
	 eyiBO0GpTPDEw==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128077:0:AUTH_RELAY)
	(envelope-from <prvs=1597FAF9A4=cy_huang@richtek.com>); Mon, 18 May 2026 17:19:46 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1779095986;
	bh=4S83+LY0nVHGep6B5D3Wsm04EAk92RsKtDHrzpnfk54=; l=607;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=boZERJEE9TI9oqREuvbZ9OPE8WrXYzL3afKIleED/Il3+kGQ7EBNpt1eD1ME0dLel
	 kCrKAwmhkatOJ7fZzhJqP4h7s2RGlyp+26/q6M0agnqLP+CrQdDkGvPJkZjk5UoA7u
	 f0Qbk8UAFjsMI0lAnkp18UhnBw9cPXZhZTaAQQi24knzLzVOEKcYEpZ0pFoRYy7SP9
	 uuAClIliDbpENsNhdFz35xnFSvK7JTfr2IBkbHfQVQ9XtCHifmXgXtvmoSCz4Nh6AP
	 7flMKgglLCZBx1hIX0vTnhyVl3W2QUyH/N2Q079vUsNqmgIfvDyitAPE2+DnYZ+el7
	 eyiBO0GpTPDEw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227034:1:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 18 May 2026 17:17:18 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 18 May
 2026 17:17:18 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 18 May 2026 17:17:18 +0800
From: <cy_huang@richtek.com>
To: <linux-usb@vger.kernel.org>
CC: <badhri@google.com>, <heikki.krogerus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <lucas_tsai@richtek.com>,
	<cy_huang@richtek.com>, <ren_chen@richtek.com>, <kevin_hung@richtek.com>
Subject: [PATCH 0/3] add low power mode support for typec ic
Date: Mon, 18 May 2026 17:15:11 +0800
Message-ID: <20260518091513.3277975-2-cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Lucas Tsai <lucas_tsai@richtek.com>

Reduce typec IC VDD/VBAT Iq during unattached states

Lucas Tsai (3):
  usb: typec: tcpm: add low power mode support
  usb: typec: tcpci: add low power mode support
  usb: typec: tcpci_rt1711h: add low power mode support

 drivers/usb/typec/tcpm/tcpci.c         |  9 +++++++++
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c          | 10 ++++++++++
 include/linux/usb/tcpci.h              |  4 ++++
 include/linux/usb/tcpm.h               |  4 ++++
 5 files changed, 41 insertions(+)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.43.0

