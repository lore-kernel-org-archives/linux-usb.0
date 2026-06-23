Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44B36A37F;
	Tue, 23 Jun 2026 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208809; cv=none; b=jmZ3Mb8dWFjONNwux/kT67FWbngWCQYg0d87D9/FHpnMQx5NSazMIWD/cqlk1+uevRRlHH9CAA8u1ELrVhhiFNcVNoWgRpVVuK3mNQhOX1VsTzx6GDMPA1B53bB3LHwVp6Vm1D6ll8wL0l8ynMd72B4yseChHjeBBpy6wLVdtls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208809; c=relaxed/simple;
	bh=KjXfCBNkkmrvvbI3p/qmHanCDc/mMcNVJT66dGr92M4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jp8xHWn/3Kc9hMvENkn7XmQTx4GudF/VpqmGOIzhHFLitXYMt7qz+21/++mbknSvvJHzTBdjwAdInk0Fq0hpgHhKw1rZMaHiXzLVmQyawqGImvIBxZ1N2Dfi1XQG3DV6aC1zVERNliyWOTe5vR4RsNT6blaHWPmxI1iLY+TdPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=AzUwH0ZY; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="AzUwH0ZY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=xrzMZ838zznizuP/NjIMUQr6/Hnr4YbMXEaj1wp1UHI=; b=AzUwH0ZYG6tH/y
	eZFkb1+uux6zLE7cmZy1PWEgoK8g5I55KHcMa6dQTx/ZigrXpLhC4+RVYYZNQpDrRxb5ItmKehHk0
	n4MGVSZ4KS3TYaq/gyWJcxlYuVK/2CGzx35sPOJmoZ3MeXk8vu9QInWB9DmSFbbf5TE6fzDQiQA4p
	9MnY8hxXm6z2/XkuHoM8wBABEZ7iQtzSGwjIX3f02B7UnME+xmpcRS30q4AuA8E+LC/eyg+hz68CV
	QSjrMimClWdZk1QATTGUpEFXohZe5QEkLkZi7QKJvea2sjRNwk2OKnh3hzKZO6J6r8ciVkoh654vr
	vbmoLcaChFo4fSxHQGkA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbxvF-00Fs45-Su; Tue, 23 Jun 2026 11:00:01 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbxvF-000000030pa-290J;
	Tue, 23 Jun 2026 11:00:01 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: dwc3: qcom: make dwc3_qcom_glue_ops static
Date: Tue, 23 Jun 2026 11:00:00 +0100
Message-Id: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The dwc3_qcom_glue_ops is not used outside of the file it is declared in
, so make it static to avoid the following warning:

drivers/usb/dwc3/dwc3-qcom.c:605:22: warning: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..ac68b4218b56 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -602,7 +602,7 @@ static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
 	pm_runtime_mark_last_busy(qcom->dev);
 }
 
-struct dwc3_glue_ops dwc3_qcom_glue_ops = {
+static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_set_role	= dwc3_qcom_set_role_notifier,
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
-- 
2.37.2.352.g3c44437643

