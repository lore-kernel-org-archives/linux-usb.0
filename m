Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C34035CD;
	Tue, 31 Mar 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970465; cv=none; b=m0njnmn2P3DN62To02yXbetToYwl4ov5U6cxUYj8mbuwGtIrO+0KA3//t3yhzwYEEaORheizN7Fr73my1F3MNLvmO4takbcQtcuXIHga/RJu1JVQ3UAFPO6tuteugXGmznzn60Zrm4oXo3uhfSzD0uTwftPhIKtwUOI3X4LsKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970465; c=relaxed/simple;
	bh=iu84T1eHW9WlicYGPGKUS05E6jrHUbTdojP+KfQm+mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qV1eU9MWJCpGU/6JmnnrqojJ9uHRjSg7UWShvtvQLiQqXBdOQM9+3agR1zmx2rclGwjhK4hk4Du1Sph5T9ES1RRToH7YQB5a17aPZ+hrf+3qIhbRuoQwSNnW/IGzbEH4jg048taVahWDG7Cv3iD1mm7btkbXKNvZMjqhT3TznF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdkL5KSA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdkL5KSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC142C2BCB1;
	Tue, 31 Mar 2026 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774970465;
	bh=iu84T1eHW9WlicYGPGKUS05E6jrHUbTdojP+KfQm+mU=;
	h=From:Date:Subject:To:Cc:From;
	b=FdkL5KSAZ+yCgc/1XqYfd3HWd9yNYhlbxJGZVn/CPgYv8kjb7MHd0DNJmITlYQTOp
	 2sL+7UR8gMverM+xUFiDpGRaY4gKg+Ed6J8EBENs2ZQNxPj4w6lv1+s6VFLC6klUdd
	 8v0ROMlQ4H5EjInGrn8MqRbrJSxCaI5Cw/sxT4pUNmjzfmKsf09E/rj/cxomMwGuYV
	 NEAcV/lzVQHbSkY27bEcqzDlWExZQxhyJVqJAAmhPdx5iBaU8+8IOVsmr6MkwOnRCs
	 Tfo0arnfbWTQVpWAtbW1b0FerZATXnKqp9KMJOjyfkSmvbbOot/I3hygIh3lfvkb7K
	 pFbOZbDZmfWZQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 31 Mar 2026 17:20:24 +0200
Subject: [PATCH RFC] usb: typec: bus: Don't set state->alt when exiting
 altmode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-topic-usb_mux_null-v1-1-7cfa4f5164bc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBNMQ6qrRETZVANmoRmBePek5
 Vv8H8GjI/TQFREcPuTptBlVWYDeJ7shoyUbBBeKS1mx+7xIs+Dn8QjvaIMxTOi1lUqJpW4Qcng
 5XOn9p/2Q0ge83A2aZAAAAA==
X-Change-ID: 20260331-topic-usb_mux_null-2cf93662d48e
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774970463; l=1897;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=d+RcB420YYsMALg1XMNL1Up138c11KN38M2mFEqyqQk=;
 b=eMMUd6/9MU0JYLzehqBr0qqlwn/sH4wcrjOdRxPY9kFavnTttftuAtFmzP15PmncFlbNz4znZ
 rJ8mcS5pJ5oDRDnK6H27Zog9Y2S3WOfG3NEndIY2GxsewDdQ6Pc/50+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, typec_altmode_enter/exit() and typec_remove() make a call to
typec_altmode_set_state(adev, TYPEC_STATE_SAFE, NULL) in order to
configure the chained muxes/retimers appropriately.

The drivers for those retimers and muxes however, almost unilaterally
trust that if state->alt is set, we're *entering* an alternate mode.

This may lead to NULL pointer dereferences, since most drivers would
then check the (still set) state->alt->svid and proceed to dereference
state->data. which is NULL in this call site. This on top of the fact
that the SAFE configuration wouldn't take place due to th
aforementioned assumption.

Stop sending these mixed signals.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Sending this as an RFC. The other option would be to go through all
the mux/retimer drivers and add additional if (state >= MODAL) checks.
LMK which one is preferred.
---
 drivers/usb/typec/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index e84b134a3381..3423f6f35b22 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -21,7 +21,7 @@ typec_altmode_set_retimer(struct altmode *alt, unsigned long conf, void *data)
 	if (!alt->retimer)
 		return 0;
 
-	state.alt = &alt->adev;
+	state.alt = conf >= TYPEC_STATE_MODAL ? &alt->adev : NULL;
 	state.mode = conf;
 	state.data = data;
 
@@ -36,7 +36,7 @@ typec_altmode_set_mux(struct altmode *alt, unsigned long conf, void *data)
 	if (!alt->mux)
 		return 0;
 
-	state.alt = &alt->adev;
+	state.alt = conf >= TYPEC_STATE_MODAL ? &alt->adev : NULL;
 	state.mode = conf;
 	state.data = data;
 

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260331-topic-usb_mux_null-2cf93662d48e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

