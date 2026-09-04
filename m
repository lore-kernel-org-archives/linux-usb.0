Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9C33F589
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530586; cv=none; b=iMhBnvcLMqr6hVWww4TJxv/VNPcS57qVWetSdfborZZrucPf+v5SwrHE2HKlayIzjaKqXgnX0dvFAsiHbCr+4EDI4K+eHzuwUs1E1EuOG/PazfzxfbvJBxxSFn+XZ/eqlyB3R/NxoD9SXbyTiyU28R10xsuTSoqYaYD1EslPZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530586; c=relaxed/simple;
	bh=cvGxjeTlRtS1bdiaFN24FBWy3uwd8OQ0PMG2HoN5DaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWX11f3YWjpXNpkPu3LIonOJ/B9TQIL0ibOU9jtTSqdUvWmpzfV6EfGD+e2Qhi3OLkiGkpFJ2vAYfYLL3Dqjn81RkWX9kiQ3xYECbQY2z2P/WZrfqIZtk/KaW7d9UYcQkTDhdlb5uj5WEDimg5Banu3sKiUcpJ6MPOx20xR0ZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHYmDzQh; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHYmDzQh"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-86e7f44b773so11765597b3.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530584; x=1789135384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1TWz/3wXzPTj1hxKdPuFCpOrgwLZcNeAFcFrJwfmyI=;
        b=bHYmDzQhxunuq5imLAy97e9u+fl/Y5mM1J6yVz4aJ5X31KHCQBDog6Raah/SK4ceYu
         tppPtFrXlP57bjPq9kYAZ3IlwKo9iArg6+sSvA2CirbabduH3c/epBGlPWFC07KXl4zL
         d433QpTdSZNEKhxop5r3KALfBfJ2WAyzta0WSlkQxYStR9Vweg+dv9SykAtxrzfPmL+E
         kGiatzVAXd151DN+KAs+LWFnJpTJvQhcL8tnLG+RpIi2EMv1i0AxvKu58+FDmIKqtgwz
         MzfQRcQFvsREwnq8F9xTiHhpfyVpEDdYN3f/aTjrqMVzIR9VrEGN2lWquLxPWMp7gcW2
         KDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530584; x=1789135384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1TWz/3wXzPTj1hxKdPuFCpOrgwLZcNeAFcFrJwfmyI=;
        b=Qyfgw+7p4NgPEylvE9t2EyKhpmfZrlKc5dnvZc4gECBmu7ZxYd/UJyZv5cwVBjBaW1
         cgQlFLubHSIj6KNcQ7tioSQJuGSsJZNeQbSejZoASyxpnR9Nra/FzBojzcgiBLzxEoZV
         fXIUmBOyT3q5bpF4tPzKnhuQgYKLg7YevHRNAaihy/9D877DQL+trzXB2vfWdyNQliYH
         T+7PhaftuB2eou+LcbR21ESAT0vVDbZq2LOmB7DfrD+IB6TnN91Tsx/Sw6YGg+pdtLC7
         Xmr7yfPnJ3TIvggmZod4ii4Z7DoDxwNoCyd9mOfa0Tf2E9i+khhVmHJ18oqALVlImyWb
         uEgw==
X-Gm-Message-State: AFuF++kbQRL8wE1+H2IyTzNC61bGfVv1adMk2PpsyHf54k7ZoV/jIpag
	R/8oDLFQgSUnp+3ZUfoAU87Jf5aIw61jwcgwy+dcObGtZGg7RW1NHCAWkw2F2DEdLVi28A==
X-Gm-Gg: AYBFou2hikUgJmk83HN+MTTr8FaF9AcdXzQ6sw3vx62AqaabR9TRhKtZDVfCI5Rz3Zt
	PkChiC8ECQIfOSv18RE2IasVz1hJ/e1CU7QivCd/ZlrmySWff2wByHZzqOMEENMuTIiQMrmMDxm
	txtNDnLZOgxdHF6fxqMhdsT6XRzO8s7SU+bAT9FOreWj2KwCh0+yzLeM4B7CSOvlPiXJfs8tszd
	Wf/Xsy0tqY3OhLaAGb7/XifpMfKnEtHBAfWV8lU/IdMZJOH3zDvs8pyrjs8VnaUm5YJ/7lCSosU
	3T9FQCCY66PXW9TBZUaJ1zARbGScSergBZScJRk1HFZMADvHWYvPABY1dZphW/L0LgafU2kgkjg
	kAv4bvNKIrpG+r5dgeFb/G989V2LZQgpJOADZLkxnWXo29oIHtyKjR0yffo+3lHzv6hHu+3QDpX
	EvCiJ1osJGPzf2VmtRjPG9tBf8pZe2O2KYEgg7ESXZFAH/TN4tYoTj2l7DdSEPp63XdUknDbL0h
	tspXVc3vdjBd159AkCa6hJN62c=
X-Received: by 2002:a05:690c:a1ce:b0:873:5ddf:d879 with SMTP id 00721157ae682-8735ddfda51mr3006527b3.68.1788530583624;
        Fri, 04 Sep 2026 07:03:03 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149ebe7d6sm18527947b3.19.2026.09.04.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:03:03 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>
Subject: [PATCH] usb: dwc3: host: fix props[] overflow and dangling xhci pointer on error
Date: Fri,  4 Sep 2026 10:02:58 -0400
Message-ID: <20260904140258.154204-1-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

props[] is sized for exactly the number of properties dwc3_host_init()
can populate, leaving no slot for the NULL terminator
property_entries_dup() requires when usb3_lpm_capable,
usb2_lpm_disable, and the <=3.00a PED quirk are all true. Size props[]
for one more slot.

This also clears dwc->xhci on the error path and adds a NULL check in
dwc3_host_exit(), since a failed dwc3_host_init() otherwise leaves a
dangling pointer that dwc3_host_exit() dereferences unconditionally on
removal/shutdown.

Fixes: 8da7644493b4 ("usb: dwc3: Specify maximum number of XHCI interrupters")

Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b..cd1e5204a 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -219,12 +219,16 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+	if (!dwc->xhci)
+		return;
+
 	if (dwc->sys_wakeup)
 		device_init_wakeup(&dwc->xhci->dev, false);
 
-- 
2.55.0

