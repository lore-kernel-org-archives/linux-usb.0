Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7A4D2EFE;
	Wed, 13 May 2026 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687589; cv=none; b=IDekQAzQNtbgFLe18rVO1HSyS5d/9sk47IJKuf00jUukla02ewZctG/N22iAcDwLgwIB7TANGqSXmWc3Z3GWuGxC7Dz7y0wR1KauwpB5dh1flxcwAu+ixuaLHW0HBSogeEVm2vhG1OAxq5hxG8TsropgnWDKCMfqui/FWxP+3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687589; c=relaxed/simple;
	bh=Gr8U8m4QgLHW602UNJuBAoLTxM7w4TlhXLQNDmiQaxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lm9iTOWghB3Zw3TbLPZGhPKQqmVJd8qjzF/F2da9XLyeEQup7XIBkSN05kwqsGHTdeigQccxXM/Hm8a3YoNkvISlP2KwQ+8V0K5iL//jNjG8PK02TfNNBIuVE721POjawmvgO4a9Omrqq/F+JJs362TO40VIfQaedG1OS1fllyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rgdArxp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rgdArxp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCCBC19425;
	Wed, 13 May 2026 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687589;
	bh=Gr8U8m4QgLHW602UNJuBAoLTxM7w4TlhXLQNDmiQaxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rgdArxp2ELZY1jjaJoCajC84iDPJcTxafqOwjEHd+7S+OX+IiYPDiub0E/MeBQj79
	 uR12AahF7ljcKUsiMh1qU1YdUchTwkaw3+nyJBORz3Tfw0x5SqjwmlX8QgfH/n7Xh+
	 wiyhQ25uc4JFCB3H2mS4ra76qzXs+1gIaAM2gHDI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Nathan Rebello <nathan.c.rebello@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 8/8] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Wed, 13 May 2026 17:52:55 +0200
Message-ID: <2026051351-truck-steadfast-df48@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Gr8U8m4QgLHW602UNJuBAoLTxM7w4TlhXLQNDmiQaxA=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84L/7GTN3qDLW6xyS7bt4JeMR/L/8g2DO0+liZe// GbzaL5uRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzk8XKG+VH6JR9mrFKbyjvn 059wr2t9M2bG+jLMFZqTUFXR7z1NN/L+9WVfDbtzVSc6AwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The connector number in a UCSI CCI notification is a 7-bit field
supplied by the PPM.  ucsi_connector_change() uses it to index the
ucsi->connector[] array without checking it against the number of
connectors the PPM reported at init time, so a buggy or malicious PPM
(EC firmware, or an I2C-attached UCSI controller on the ccg / stm32g0 /
glink transports) can drive schedule_work() on memory past the end of
the array.

Reject connector numbers that are zero or exceed cap.num_connectors
before dereferencing the array.

Assisted-by: gkh_clanker_t1000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb9..539dc706798d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1380,13 +1380,22 @@ static void ucsi_handle_connector_change(struct work_struct *work)
  */
 void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
-	struct ucsi_connector *con = &ucsi->connector[num - 1];
+	struct ucsi_connector *con;
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
 		dev_dbg(ucsi->dev, "Early connector change event\n");
 		return;
 	}
 
+	if (!num || num > ucsi->cap.num_connectors) {
+		dev_warn_ratelimited(ucsi->dev,
+				     "Bogus connector change on %u (max %u)\n",
+				     num, ucsi->cap.num_connectors);
+		return;
+	}
+
+	con = &ucsi->connector[num - 1];
+
 	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
 		schedule_work(&con->work);
 }
-- 
2.54.0

