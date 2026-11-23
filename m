Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443933;
	b=19GjLMIP7KWHp5xSOKCq18paaARB/iTLSOkVGNAWefcfT6DIfP+kiWSWwaQh61EFD4VS
	 bBoKDAb2AH1ybusHW7J0UgudXm7XsomAZFsN/IWWZmRae2u9IvPxf5DtxWO8f+tit11WR
	 EadcQBylvziqpPzrC+LQWyW9dC+/K04d9zkltWHwSDbT5pCOhn0NrkGcZtwAtX+7XVOSN
	 ZLJQOqxHGHw+FG3TThgdOxt4y5PJZErl2CwLEplgwMROxb7/LlBzDhbepPpDtQF6P4pfp
	 YZo8uUTwsCr43YnMesG/DyjG7KTEkkwwpRsyLvL8Nvkjeb/PJDg7Kh6PXBHA9ZDhfrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443933;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=VsyKwA//DP/bolHNMGSpBmTmDzPU2JcWNbCgHE0Lgls=;
	b=j794PsQ+QTgVpajB28u6qgTOUZQpiR+OfhUTzdhemyBM55AxLMqIr37B65O5uXBtaRBY
	 J1GDna90q2t1wi4lW3ezU3zr9ZToDvJ/V3oUiA4b0nC3OKzMJOJWxQ1GqVQ7rwVCfsM9R
	 DIZ06cp6HteQZoHgHxS0Ns1adeM6WU7CscmfKoVBbBwygWNCL9Mwfi2zL98Kyv9g95afL
	 dfu5CZM8VLUHVW76BttykhPfP611lqZEYNKd8exfV/md7VZ3q5gSw38q0w6Qtnb/wlwJ6
	 e7E/OdqPdq6hDKFG9GZOGYgNTJQH9MM6WfvbXPVqpL6BlQ5k9rdQz+XJAHISgj6rKIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b="F441k/qD";
	arc=none smtp.remote-ip=217.74.67.49
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F52A606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F52A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=F441k/qD
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Mon, 23 Nov 2026 15:25:27 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: gregkh@linuxfoundation.org,
	jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com,
	zzzccc427@gmail.com,
	bigeasy@linutronix.de,
	nab@linux-iscsi.org
Cc: Slawomir Stepien <sst@poczta.fm>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Subject: [PATCH v2 0/3] usb: gadget: f_tcm: fix TPG lifetime and lock ordering
Date: Mon, 23 Nov 2026 15:25:10 +0100
Message-ID: <20261123142513.204652-1-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795443929; bh=VsyKwA//DP/bolHNMGSpBmTmDzPU2JcWNbCgHE0Lgls=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=F441k/qD92VtMR45PSVjwrrVxSzG2VqUs6oJdzLCEzIJ4GEyikuyEdO0Vd+tDt/AE
	 Mil9aEobR515yghT5mbqtfULG+/KyuT7ylSrOHOl//EzqrUZX/LXMjEvgTd3nKaoZg
	 7f8np/s3Od+zF5JFC9E6AdLTuTGA+Axy6rxbm95Y=

This series fixes three f_tcm bugs. All of them come from the gadget
and the target configfs trees being set up and torn down independently:

1. Disabling a TPG while a UDC is being assigned can deadlock on
   dep_lock vs gi->lock.
2. Removing an enabled TPG while the gadget is bound frees the TPG
   under the bound function (use-after-free).
3. fu->tpg is copied when the function is linked, so it is NULL if the
   TPG is created later and stale after the TPG is recreated. Taking
   tpg_instances_lock there also causes the syzbot lockdep report.

Patch 2 makes sure a TPG is never freed while a function is bound to
it. Patch 3 relies on that: fu->tpg is taken in tcm_bind() and cannot
change until tcm_unbind(), so it needs no extra locking or reference
counting.

Tested with dummy_hcd, KASAN and lockdep: linking the function before
the TPG exists, rmdir of an enabled and bound TPG, recreating the TPG
and rebinding, enable/disable racing with UDC writes, and the legacy
g_target. Without the respective patch these hit a NULL dereference, a
use-after-free and the deadlock.

Not addressed here: usbg_make_tpg() calls configfs_depend_item_unlocked()
under tpg_instances_lock, which gives a separate lockdep report
(su_mutex -> tpg_instances_lock -> configfs inode lock). It is already
there on v7.3 and is not changed by this series. Since it turns lockdep
off, I used a local hack (lockdep_off()/lockdep_on()) to avoid it
during testing.

AI assistance: patch 3 was first drafted with Gemini (gemini-4-argon,
gemini-3.8-flash) in the syzbot AI job linked from it. Patches 1 and 2
were written with Claude (claude-opus-5-5), which I also used to rework
patch 3, update the changelogs, draft this cover letter and run the
tests above (virtme-ng, dummy_hcd, KASAN, lockdep).

Changes in v2:
- Reorder: the dep_lock deadlock fix and the detach-on-drop fix come
  first, and the tcm_bind() patch is last, so a TPG can no longer
  change or go away under a bound function (Greg).
- Patch 3: drop the dep_lock around the opts->tpg writes (Greg), the
  can_attach reset in usbg_drop_tpg() and the !opts->tpg check in
  tcm_bind(). They were only needed because of the old order. Document
  why opts->tpg cannot change while the function is bound.
- Patch 2: note that it relies on patch 1, and that patch 3 fixes the
  remaining stale fu->tpg.

v1: https://lore.kernel.org/all/20261022134926.1125473-1-sst@poczta.fm/

Slawomir Stepien (3):
  usb: gadget: f_tcm: don't hold dep_lock across
    unregister_gadget_item()
  usb: gadget: f_tcm: detach gadget when dropping an enabled TPG
  usb: gadget: f_tcm: take the TPG in tcm_bind() instead of tcm_alloc()

 drivers/usb/gadget/function/f_tcm.c | 32 ++++++++++++++---------------
 drivers/usb/gadget/function/u_tcm.h |  6 ++++++
 2 files changed, 21 insertions(+), 17 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0

