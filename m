Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7236405A
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805866; cv=none; b=fmkNlF/98cCtkSAREhkpjd/xnzSvwkFpcjZbfcq7L+TtY1r1R/B19sBS2WCmbnTyIy19Feay5ziDS+SoGwHeuCl9EXGoUJi+yiQbu5F9Us/gSMdUXuSkWs71Lv4oa0JWto/G0xVV0/oDE2CGwCVtL5FPszOSjd3uBx+j8nKQJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805866; c=relaxed/simple;
	bh=cXq4ckXbDt5qTacGW/Dz8TiO8463xOq5t/ItvAzBv74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ymn4pYS3amuTPfEnmfPQ0YyjsaKmpX/NDYrhD55dIlzEU49XZLsBNRkmzgUTVUGnel3d7218I9t7wl0sJUZPeocSlbcYxnTgOwmdGr83RY7ikTRCL4gEdYynFx7gBWIdnjk3GLsvTjEge4RR8vOooqUv70Ho7KwhmMn9hi8dIYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQ2QGvwx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ2QGvwx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da9so405660f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 11:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788805863; x=1789410663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0L7d6qm/+lnh2raU5fD/UwCh6P1gxbArjmHlEi+oqeE=;
        b=EQ2QGvwxfMBPRgIxjYQnBk73ZOrI0ynsz+OrGpW9TI5CcfvYvohgRiKO2dLb9Z557w
         BcBm7D7zhtmr95WjR48/3Cid6klzrIQgFvnEcWZX+fVPAcvgkin081imeigQmp/mUPAv
         AXE+4Lnf6h8y6qqtZjMVDexFseA8Gh8gNhLN2qSLKqiH8CKpNdjh+BX0VOe/H3UjZj3F
         Q69n3KVF+QtI0UcjXnVLbYfhN4UgOH8xltjG+5VchZ8iU92wJYdknSPY8ghQT8EoAU8R
         QiYJFgqyGlqOY+QCVG7w98Z92bvY5taVkKw3PraX4t2YS5R4knC0PCA3HnoMsKKetcvv
         4B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788805863; x=1789410663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0L7d6qm/+lnh2raU5fD/UwCh6P1gxbArjmHlEi+oqeE=;
        b=fYA/qADTHjmRs6FEtr2PxS2XM5FocdzJtT4kqfzTqxCKknaDypQV6Px0XnTfge53gl
         /q8Iz1aFQcrxjE7siUrs02rjzlXbYkI4knFC5+X4MdP5GGNjU6nKxXaDE+s2npAB5Xpb
         iwftZm8OwnOeNc+g1V8vXSJ8rG5Q7CTERKLwm0aOXRLJGu2q3COUnfvdFVcZ/eQCSoQO
         cmd/f+xiMeDnX0sJzETMB8KzshBClOwzYqMuIhwpfJ5zyViLM3nYkn+w37eVrG9Pkc5o
         SDuqOfoCosCq/0UbMBzaHoL6GyonMHjYXhM9EbnO66VXf2x05yAYSLyU2v5jEHaDEx5w
         aXbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRf1O8lDfQOj23sTciX+C+txz4rA14nDHnZghTtCUVJQEeFywlNeHrK1ypUET5k5ur1IZVRK3JCLA=@vger.kernel.org
X-Gm-Message-State: AFuF++kPiwPenOKWUCVCzqrtQB1vtQ3IFfvsxoY28TfFcUymfoRd3AG0
	eIOEhDWUr0yWFsz50/yyT9F4hnhoTtcu+bvTrS1JYtY3nlsu/CkouybJ
X-Gm-Gg: AYBFou3Gy1HuWZw19kGqz07w6mfb8ows0dxmHWupK6ntYlrpkVqVMJYnY28HPBGfWOM
	oE3JJVX5KfTtaslTJJiz7QpcZz9XWpEo0XxaBZ0tqhRaczcjyufz2DRNeBjCww+KnGLW0rpwlps
	xpn1hhS49U9+Wh5TE8vi6z8kg5hvBJ94hVyuWASnQPSz/WCOVxonWfZIIjViIU4h+R72b3lFKZC
	V7utfEDFWjV7ZKfFp1pc4bx+WCZVPUulsAYwzlrvrMwOYjFvgCCPfpIz05Pof9esHZjdw8uY+mm
	PZPqF87vBvXs9QgdV6itGAyHtnl9tFnWSItQu2Rf2MDg6teDBz2eHygWEFEBDKbWhSN2TRhGTLa
	CdIFMws0mTZ1yQAQHQO5ox3UBXe0zBCoWW/iRugA0KpCtNUzTA6P7LxabX1COCzGCEKdqauR7Yt
	i48tTM9pi0mJmIFCQW523znVhnAOrGWW5O/zwvlrONFRJCV07rlsZytH+rMs3HBrDy/2AEqxiBy
	kx6FHg3TfNLCYG8rpMNX91n4bVwIuucHUi+Pp4bMieVRE4+5yLgVPrjpk5+d2KaCWXuHXk5llnJ
	Uw==
X-Received: by 2002:a05:600c:4f48:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d079867f5mr141408595e9.0.1788805863135;
        Mon, 07 Sep 2026 11:31:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B882200F5E89D570153D0A0.dsl.pool.telekom.hu. [2001:4c4e:1b88:2200:f5e8:9d57:153:d0a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm871127675e9.0.2026.09.07.11.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:31:02 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] usb: typec: tcpm: fix use-after-free of the kthread worker on port unregister
Date: Mon,  7 Sep 2026 20:30:41 +0200
Message-ID: <20260907183041.8253-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcpm_unregister_port() destroys the port's kthread worker first and
calls tcpm_reset_port() afterwards.  Since the Discover Identity retry
mechanism was added, tcpm_reset_port() calls
mod_vdm_discovery_cancel_delayed_work(), which does
kthread_cancel_work_sync(&port->vdm_discovery_work).  That dereferences
work->worker, which still points at the worker that
kthread_destroy_worker() has already freed:

  tcpm_unregister_port()
    kthread_destroy_worker(port->wq)      -> kfree(worker)
    ...
    tcpm_reset_port()
      mod_vdm_discovery_cancel_delayed_work()
        kthread_cancel_work_sync(&port->vdm_discovery_work)
          __kthread_cancel_work_sync()
            raw_spin_lock_irqsave(&worker->lock, ...)   <- freed memory

KASAN report on 7.3-rc1 when unbinding a fusb302 port (RK3588):

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x10c/0x210
  Write of size 4 at addr ffff00010122ef04 by task bash/8349
  Call trace:
   _raw_spin_lock_irqsave+0x10c/0x210
   __kthread_cancel_work_sync+0x60/0x408
   kthread_cancel_work_sync+0x20/0x48
   tcpm_reset_port+0x18c/0xb80 [tcpm]
   tcpm_unregister_port+0x104/0x2f8 [tcpm]
   fusb302_remove+0xc8/0x200 [fusb302]
   i2c_device_remove+0x7c/0x288
   ...
  Allocated by task 112:
   kthread_create_worker_on_node+0x14c/0x2c8
   tcpm_register_port+0x288/0x3918 [tcpm]
   fusb302_probe+0x604/0xc88 [fusb302]
  Freed by task 8349:
   kfree+0x260/0x558
   kthread_destroy_worker+0xa0/0x130
   tcpm_unregister_port+0x74/0x2f8 [tcpm]
   fusb302_remove+0xc8/0x200 [fusb302]

With CONFIG_PROVE_LOCKING the same unbind shows up as
"DEBUG_LOCKS_WARN_ON(lock->magic != lock)" in __lock_acquire, followed
by an oops in the unbinding task, which then exits with interrupts
disabled and the following shutdown hangs.

The work itself cannot be pending at that point: kthread_destroy_worker()
has flushed the worker and the discovery timer is cancelled right before
the cancel call.  So just remember that the worker is gone and skip the
cancel in that case.

Tested on an Orange Pi 5 Plus (RK3588, fusb302) with KASAN: unbinding
the port reports the use-after-free above without this patch and
nothing with it; the port binds again fine afterwards in both cases.

Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM
---
 drivers/usb/typec/tcpm/tcpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a8cd1959c426f..e47d674c2ae00 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1756,7 +1756,8 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
 static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
 {
 	hrtimer_cancel(&port->vdm_discovery_timer);
-	kthread_cancel_work_sync(&port->vdm_discovery_work);
+	if (port->wq)
+		kthread_cancel_work_sync(&port->vdm_discovery_work);
 }
 
 static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
@@ -8961,6 +8962,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
 
 	port->registered = false;
 	kthread_destroy_worker(port->wq);
+	port->wq = NULL;
 
 	hrtimer_cancel(&port->vdm_discovery_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
-- 
2.43.0

