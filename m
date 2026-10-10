Received: from mx.eu-west-1.pants-on.net (mx.eu-west-1.pants-on.net [52.48.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D43451984
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.48.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630288; cv=fail; b=d4y+2qW7wj6rJGIw98iwSieOx7ZHjjuhsPFA0m0+CZn1ZTTGU6JnvQJwhlstNwk4Mf1nZjes7qtPTlpCnxJXgj4cTYLD/05Yi99lckxl6kojnomv/mfTv+VGTm3HxMKpmmBtlX02HdQXgMqI8xS24C+vrujnYGsGtuX9qYcrStY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630288; c=relaxed/simple;
	bh=PA0gpYuL9Sc0pQpb0IG7wfO/HdsgcPxep78OwUvAZmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3lxOD/Uh3AQFbxwfkYI+2yy27czEu2PJdKx0eSaREKjM88d2uyF6OquG8AbJeSSYA8AsfkZJdy9ljwrsr892QKHUc3sLIQFrnm18zyiSKq59kB8QI/Co4BE6wa9UO1G0eObMEEpWsonONolh087DntBZs09GaZJcnolpzL5wyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jacquin.bzh; spf=pass smtp.mailfrom=jacquin.bzh; dkim=pass (2048-bit key) header.d=jacquin.bzh header.i=@jacquin.bzh header.b=JfptAh3/; arc=fail smtp.client-ip=52.48.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jacquin.bzh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacquin.bzh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacquin.bzh header.i=@jacquin.bzh header.b="JfptAh3/"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=mx.eu-west-1.pants-on.net; s=20240827.rsa; t=1791630285;
	 b=f8hlz0WEMTBoIM3ASo8WZE5vYG2FBR6F/sAYqfRG9ngw9146nUSWBvn9/TfA5Lt9/SJzUb/9aE
	  tFoLXyYqLopmnfapnReFSTV33fOfXHM6EIwZj88gL9R2KLo4++Jipk10TzhzINJc2WkNYtKbJ4
	  cRRtHmOniKWeLta5rH0tKLA2zn/FkBoKAvUXXzsMdd0GkTW8nxIwu2YVoqLofRpkixE7tODKoD
	  BdCImmgvVTKhBXHiIx2+kX93VFvw28BqMm16M4wS0IkaemAZGfuInIk1430AwlemtPGp7fX/K1
	  554y2fNxHja6v7uPLOp5hKPVMojlqvRaRL2jkekUSD+kqw==;
ARC-Authentication-Results: i=1; mx.eu-west-1.pants-on.net; smtp.remote-ip=2001:470:1b3f:100:c143:c31c:85e6:efd7;
	iprev=fail smtp.remote-ip=2001:470:1b3f:100:c143:c31c:85e6:efd7;
	auth=pass (LOGIN) smtp.auth=bertrand@jacquin.bzh
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=mx.eu-west-1.pants-on.net; s=20240827.rsa; t=1791630285; x=1794308685;
	bh=PA0gpYuL9Sc0pQpb0IG7wfO/HdsgcPxep78OwUvAZmU=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature;
	b=SC6brtUSiM0wFf0yGSPu+OJpzrbpLZdTA9IKma7KqHdgYAzkmRTbBhHCu9QK+qZKOW3Pai7K0L
	  TafjEy294UIiSK/2OpOWtKeFqxqS5ry7RBkm8EiDzPdG3UoVY0mcZGnr1JzeVwgchUXuoE73c5
	  L9C83JYf+1IiHiYu62IMwS/oM5hzuegHCLB0sEH/ae3IbUBKg0Vu6gqwG7obckAnbafN01t99i
	  wJYGSsMfYlWtUc046OTUk13obZaIuHhXPlx/IzXT4i2gQcgjVmJYeO88yW9D94ZkRQJrPSFfHk
	  YWIceXUdagNgQvLpsWbuwxfNogjJb25F9W6bKCdjYJOUjA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jacquin.bzh
	; s=20240222.rsa; h=BIMI-Selector:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:Author;
	bh=PS3ypG6/V5TKHBrClzMCRNtxHOfvTt2g3hC576rf8ds=; i=@jacquin.bzh; t=1791630285
	; x=1794308685; b=JfptAh3/KX0zfw1sX/Pjpo7pakreES1olYFMcsiVn3a1n6yTbFjXXf2hCEl
	Ugunz2YfY3T+hboXAGdi7Fq/PGiSXC3y9ZDWDMSY7K/yaquXLO6cf6/lMqZMCblcToL92BoiGNmmN
	dk4wfZ6SZ+w8facF/bx8ZBD77uaGkvAj35F1OC6QkA4nUHcquK03hF0MsCbKgFmcmB77wq26D3pKb
	BjUOxAmRj1YnA9Lo/H2k7onatCqXSWeLq7BnOYBzRnrsRZ8wKJpWLG/cK8NddJc41BYekzR/Jh4Kz
	/QSLJJ4gxVnygCIofmJCh1Lz4fFG/6FdR0ktSseeF9kI3xWsOwjQ==;
Authentication-Results: mx.eu-west-1.pants-on.net;
	iprev=fail smtp.remote-ip=2001:470:1b3f:100:c143:c31c:85e6:efd7;
	auth=pass (LOGIN) smtp.auth=bertrand@jacquin.bzh
Received: from [2001:470:1b3f:100:c143:c31c:85e6:efd7] (port=17080 helo=lady-voodoo.lan)
	by mx.eu-west-1.pants-on.net
	with ESMTPSA (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	id 1xFUsd-00000000yGf-14lP; Sat, 10 Oct 2026 11:04:43 +0000
From: Bertrand Jacquin <bertrand@jacquin.bzh>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: venkat.jayaraman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix NULL pointer dereference in power level debugfs
Date: Sat, 10 Oct 2026 13:03:57 +0100
Message-ID: <20261010120357.4937-1-bertrand@jacquin.bzh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
BIMI-Selector: v=BIMI1; s=default;

ucsi_register() creates the debugfs entries right away, but
ucsi->connector is only set by ucsi_init(), which runs later from
ucsi->work and only publishes the connectors once the PPM has been
reset and all ports are registered. Until then, or for good if init
fails, ucsi->connector is NULL, yet the peak_current, avg_current and
vbus_voltage show callbacks dereference it unconditionally.

On an Intel NUC13ANKi5 whose PPM never answers when CONFIG_ACPI_EC=n,
reading those files after the failed init oopses:

  ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
  BUG: kernel NULL pointer dereference, address: 000000000000045c
  #PF: supervisor read access in kernel mode
  RIP: 0010:ucsi_debugfs_register+0x291/0x420 [typec_ucsi]
  Call Trace:
   <TASK>
   seq_read_iter+0x1e4/0x4c0
   seq_read+0x12b/0x160
   full_proxy_read+0x9a/0x1f0
   vfs_read+0xba/0x320
   ksys_read+0x74/0x110
   do_syscall_64+0x79/0x240
   entry_SYSCALL_64_after_hwframe+0x71/0x79

Return -ENODEV from those callbacks while no connector is available.

Fixes: c851b71fd6cd ("usb: typec: ucsi: Add support for READ_POWER_LEVEL command")
Cc: stable@vger.kernel.org
Signed-off-by: Bertrand Jacquin <bertrand@jacquin.bzh>
---
 drivers/usb/typec/ucsi/debugfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 77a0dd75edd3..911a151ac16a 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -92,6 +92,9 @@ static int ucsi_peak_curr_show(struct seq_file *m, void *v)
 {
 	struct ucsi *ucsi = m->private;
 
+	if (!ucsi->connector)
+		return -ENODEV;
+
 	seq_printf(m, "%u mA\n", ucsi->connector->peak_current);
 	return 0;
 }
@@ -101,6 +104,9 @@ static int ucsi_avg_curr_show(struct seq_file *m, void *v)
 {
 	struct ucsi *ucsi = m->private;
 
+	if (!ucsi->connector)
+		return -ENODEV;
+
 	seq_printf(m, "%u mA\n", ucsi->connector->avg_current);
 	return 0;
 }
@@ -110,6 +116,9 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
 {
 	struct ucsi *ucsi = m->private;
 
+	if (!ucsi->connector)
+		return -ENODEV;
+
 	seq_printf(m, "%u mV\n", ucsi->connector->vbus_voltage);
 	return 0;
 }
