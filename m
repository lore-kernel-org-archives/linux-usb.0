Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B773D88E3
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364378; cv=none; b=f6F+BiUBeWVLtuFrmhlsiqy94BwfrP+k69c2UigFa3h3M0EYjaeSwuwWIrf5qcKfcCCjHKtBulAlb+AbgDAaOEL1zlNLyR86uC6fH5BB1cnLpnOenSYdfPfSVpRPOzUX3JcPv1OfQT5YHXwVKKB4ICcgXX4tC1xkXoDcQ/geP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364378; c=relaxed/simple;
	bh=nPcJjN+vQqTAovueiMa6Hbrfa4aQlErz1pqqHKuwg6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIFzied35ucgHLBeRuU/Jbrha/P+IvbMq/h1BsW1Ds2+iDhVW67zWQ+TN3tDRHAF8KwEKD7MliQkQsZpmMY8qnlJ26mQaur1vsnJ+YR/rKje+AxG7Wyx1GuqEQSECcQDFHu2yWEzkNq2Rr7thhMYIU4LnIrbDWeiHXpvAqqbs8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=xduV65ND; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="xduV65ND"
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nPcJjN+vQqTAovueiMa6Hbrfa4aQlErz1pqqHKuwg6k=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792364372; v=1; x=1792969172;
 b=xduV65NDt8CNwttyfZn10q2UgLVD3mxjgWUWe5fS+XCGgiZqf5dhCA9t13had1S2Fq5YoGW7
 YeWFsfjGq/qNFtN33KYGlY9pJkbKu+yCq7dvYbEhZswnJEgl909rayAjs2G01LSLtB2sfYjzCgn
 MTT6DRlx2O2Wb4l2/6w4OTGwS3qf8i7fVMAZym6OWEQT3woBBKNG1Fe/Rf2G7rSGLqAapfBhEEZ
 FHqWE4VseIHsghS5iViOUVc5wR6GwLavFPjy58r/fy0b0Fhr8EZfcaUETFKEx1tdDNyIt1063Ae
 2tDKuoid+V4gsCSBIOPtl9eZojQvym0D6nbDMcXAY8EaQ==
X-Envelope-To: linux-usb@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b32fc5b4d4e5310e;
	Sun, 18 Oct 2026 22:59:32 +0000
X-Mizu-Trace-ID: b32fc5b4d4e5310e
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: fsa4480: Support reporting hotplug events to a codec
Date: Sun, 18 Oct 2026 19:58:55 -0300
Message-ID: <20261018225906.1265299-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the fsa4480 USB-C SBU MUX is not actually used with audio
codecs in mainline. I have gotten it to work with the wcd937x codec
on sm7325-motorola-dubai (copying the Type-C notification handler
code from wcd939x to wcd937x, will be sent after this).

The fsa4480 driver changes Luca Weiss sent me were the only thing missing
for me on top of the wcd changes.. I've added a backwards-compatible
dt-bindings change here and it seems to pass dt_binding_check dtbs_check.

Thanks,
~val

---

Luca Weiss (1):
  usb: typec: fsa4480: Report switch & mux events to codec

Val Packett (1):
  dt-bindings: usb: fsa4480: Add an optional audio port/endpoint

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 90 +++++++++++++------
 drivers/usb/typec/mux/fsa4480.c               | 51 +++++++++--
 2 files changed, 108 insertions(+), 33 deletions(-)

-- 
2.55.0

