Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99624388885;
	Fri,  3 Jul 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077273; cv=none; b=KBdLmOBcOOT2iwrjqY9FCT+k3qxwYQVdgQmMDjgCSigemYTr45y0r0nbCAFAlOJ1JAnEjrU86EVo6H9jeAvFlZRfPCQcGkA1mI4N6ORFhMxrLU3C2EusA+xsCrHBTGHspve8YpjqThveuG6jCN01mGcu+9JaA8GegUBl5UT4ePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077273; c=relaxed/simple;
	bh=eDHiRT/+1z97fz+HUcT6oVSr58/vj67tduOemkH4s9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKyLew5Mg8ck6n6OoRNIrqufjtMEsfJrR2xaZ8mDtSebS56nGN/fILjOJfztUwW6tKhmRI4pRCOKNualZCvTlx1o7LhUthuloViKTwEaByqtwTHADBH1o4IDPX8DJa3kB7jnBAzXJAvDydsp9Ajj7v0mpe9jKHmwE8Lzh029aEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3BCE34C2C37F00;
	Fri, 03 Jul 2026 13:08:10 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: cancel pending work on system suspend
Date: Fri,  3 Jul 2026 13:07:37 +0200
Message-ID: <20260703110738.8457-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Dell XPS 13 9360 (BIOS 2.21.0), entering system suspend (deep/S3)
races a pending UCSI connector-change worker against the ACPI EC teardown.
The worker evaluates the UCSI _DSM (GET_CONNECTOR_STATUS), whose AML
accesses the Embedded Controller. By that point the ACPI EC has already
been stopped for suspend, so the EC address space handler rejects the
access with AE_BAD_PARAMETER, aborting the AML and failing the connector
query:

    [22314.689495] ACPI: EC: interrupt blocked
    [22314.711981] ACPI: PM: Preparing to enter system sleep state S3
    [22314.743260] ACPI: EC: event blocked
    [22314.743265] ACPI: EC: EC stopped
    [22314.743267] ACPI: PM: Saving platform NVS memory
    [22314.744241] ACPI Error: AE_BAD_PARAMETER, Returned by Handler for [EmbeddedControl] (20260408/evregion-303)
    [22314.744432] ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV.ECW1 due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
    [22314.744673] ACPI Error: Aborting method \ECWB due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
    [22314.745201] ACPI Error: Aborting method \_SB.UBTC._DSM due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
    [22314.745394] ACPI: \_SB_.UBTC: failed to evaluate _DSM c298836f-a47c-e411-ad36-631042b5008f rev:1 func:1 (0x1001)
    [22314.745414] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate _DSM 1
    [22314.745424] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)

ucsi_acpi implements a resume callback but no suspend callback, so nothing
cancels the connector-change work before the firmware/EC is torn down.

Add a `ucsi_suspend()` core helper that cancels the pending init and
connector-change work, and wire it into ucsi_acpi's PM ops. The connector
state is re-read on resume by `ucsi_resume()`, so cancelling the work loses
nothing.

Fixes: 4e3a50293c2b ("usb: typec: ucsi: acpi: Implement resume callback")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
Assisted-by: Claude Opus 4.8
---
 drivers/usb/typec/ucsi/ucsi.c      | 20 ++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h      |  1 +
 drivers/usb/typec/ucsi/ucsi_acpi.c | 10 +++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b16..6a6723e8fb127 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2017,6 +2017,26 @@ static void ucsi_resume_work(struct work_struct *work)
 	}
 }
 
+int ucsi_suspend(struct ucsi *ucsi)
+{
+	int i;
+
+	/*
+	 * Cancel pending work so it cannot access the firmware after the ACPI
+	 * EC is stopped for suspend; state is re-read on resume.
+	 */
+	cancel_delayed_work_sync(&ucsi->work);
+
+	if (!ucsi->connector)
+		return 0;
+
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		cancel_work_sync(&ucsi->connector[i].work);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ucsi_suspend);
+
 int ucsi_resume(struct ucsi *ucsi)
 {
 	if (ucsi->connector)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 325ed1e5ca804..6e1608d88ec3d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -582,6 +582,7 @@ int ucsi_write_message_out_command(struct ucsi *ucsi, u64 command,
 				   void *msg_out, size_t msg_out_size);
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
+int ucsi_suspend(struct ucsi *ucsi);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 60b12961e1a47..18286d3e9cc59 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -263,6 +263,13 @@ static void ucsi_acpi_remove(struct platform_device *pdev)
 				   ucsi_acpi_notify);
 }
 
+static int ucsi_acpi_suspend(struct device *dev)
+{
+	struct ucsi_acpi *ua = dev_get_drvdata(dev);
+
+	return ucsi_suspend(ua->ucsi);
+}
+
 static int ucsi_acpi_resume(struct device *dev)
 {
 	struct ucsi_acpi *ua = dev_get_drvdata(dev);
@@ -270,7 +277,8 @@ static int ucsi_acpi_resume(struct device *dev)
 	return ucsi_resume(ua->ucsi);
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_acpi_pm_ops, NULL, ucsi_acpi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_acpi_pm_ops, ucsi_acpi_suspend,
+				ucsi_acpi_resume);
 
 static const struct acpi_device_id ucsi_acpi_match[] = {
 	{ "PNP0CA0", 0 },
-- 
2.54.0

