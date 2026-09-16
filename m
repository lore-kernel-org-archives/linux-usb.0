Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BD6448B9C
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545536; cv=none; b=kfRhb4wSgnX0Mk8tt05oq09fY5DFGnsPE1ZgmsX3ECmb9aS4Mlg0GzqSfHWN5WW40VD38vAcRrS51AiLoh8a+lfv0sWLtQqk6DcrdTtZCrXnEz5QI55fEo1V+9cY02902zKNN2+Va9Z5Yte7dAFIFsT3EbiTnHaOkQOaK6uaG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545536; c=relaxed/simple;
	bh=PPQwnBevhndYutuKDdDvehHKW7FqGHGO5QlRVDsedNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlppEABuzLcvn/Wl0za6hOSUlpH/cTg52Pcq1n234HJnukt4ou4x+oOKgXiJC3reYH8lSNuRmp2zPZK/iP3KVofxJD0esZKI1Csl4EWXkDUJp/yXeKv5HWXcI/zmK1rzSunMSiyEBf+hc/1o/Kxh11lHrfPD1kYVT3bwM0zWzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ipq2ISt0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ipq2ISt0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so453677a91.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545528; x=1790150328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=Ipq2ISt0pOHBw/MedOHquRdKJL8cr81NU8lTbtIi0375m9EvnwtQ5Cu0+JLOohQWAH
         Z2yAczKbLMHtbCZ1JR5dvkvOPKbIZp1zWutKzSKJouwlTG0iavUXgS6XXeUJucT/9HoF
         LmR92+Lbp15SkFfG87C9Q9+StcoQp2bKXq/oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545528; x=1790150328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=TBouSpM/z19lGrxpuJzCgnetfY+fLWK7ZCu/lFPhAsB+HsIH3oqRsfJ6AmBXYUxvES
         XlZw5LBkB+FNtedYevNuU7mSXT7aiQljbE3Aqxts/FhJh7RaQFe/NubHQyLFFXb+n6Wi
         DldHt4pf1se33CRcU3JWy+IQ30Z3zzqet3fHgHFmhWnnbgUe65NTYa8nyhsh3uhdDnu/
         KE8eDfrzsnn1xL/9gmBdsOnwTueFYFVInUHh5pVgV2GGl2hLtpM+wnSsEAf1Vxw0unly
         FG5B6nJcAdPgWRkSoFSQOVb9q/odG7hHEsTEC8ZG9IOB86LzLNGUG55D4dCvL0iy5clR
         3pRg==
X-Forwarded-Encrypted: i=1; AKwUvBw2Npb45+Etw2KZe1eIFIhWbR1Iq+j9vrUdZfckNXqwpvvw5AiqOM1q7qlOV7VACP2mG5CzDHnQzeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRfIUUVrkowVnVLIe9cxFbqmv4NLoi7qjj7tkyZs+5GDS0Wlq3
	pQdc+lpBa/R4u8M0h9k1yJu2Pub5lCFN4GMBfL90zmPod2sek4UgafBmwqkUmRNzcw==
X-Gm-Gg: AYBFou1N/ls0oPyG2UWtH7f1S2auY1IOC8alte1GFfOr6ru2O1UhuiBVU/EL/+H3zqh
	uIwXHbsJ7NR6CavzwriFPnqq7QcqexMP50fBvXwrp7Bk/uhPEekvrxE3XUm9iJBLGCMXAPnM28g
	DtIpKK2OFyNt6t5s+TEaazteiBaQHh3cxtKKYN5BFQUpgaE8nMnWjsb3cEpi/D82Uj0kN9XJ7Me
	742dbW8MwGst4EhUfuymqwtZGdaD20+Ye2s7PUCSZzh4/Dext2NEaGABqRZI2TukRBGvPjErhcY
	yEEYgduysal41LfQq2wJa5ukFNEFlHo809K7MuLBn3z4IftWOBkpmIGiBL6S/tcR/mCMZ4izr1h
	qdptYV2MxthNk0rc/alcMM2YKpnp7rbPOjKA3risC/FxOY/rSclHi0Nz+6p97TkGEYRsII9pBbj
	aGHJx3IhBP1GSnI4xSgO+Tu5mw3Davvlj8RgZDzDfUOoteMyPDxyiLlTTQGKO85A19ZXh5dLKIH
	XIi2HoNdPr2pVL5UWiJubipyy/ut4VNhtPuP7uixBFxiYjmNa5Npc0mGLdgCzzAdLDX
X-Received: by 2002:a17:90b:39a3:b0:39e:233f:cee9 with SMTP id 98e67ed59e1d1-39e233fd063mr2563733a91.11.1789545528600;
        Wed, 16 Sep 2026 00:58:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 05/15] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 16 Sep 2026 15:57:31 +0800
Message-ID: <20260916075745.3549953-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a4ec79a06a5c..707eeee198b0 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.1032.g73a4cd73de-goog

