Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C244C66D
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626722; cv=none; b=HpxyxQrJNGAdj2WfbmOq9jJjs1rYtolkq3NZW+jeKjh3nJsWbbUGTWVLkBJ2jWdLxhbovHy+am2pMZ3UDFzJ60o4yWA/OkeClP09wA4nXY/eAZf8NW/oHyo1UKUVRRO15eCNuky6oREFj6VmLNXPWsHO1ls3tT+QtHN3ls7VhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626722; c=relaxed/simple;
	bh=ifc7H3d8cophRdBVvhP/1sBwTZYA0mepFYMjpoBRgcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nbo24Oh/3WeRcDyuFFhr+V7xwO0Fxu/8pQEe9qrWh6I6pQxQRYMkG+G1SSAHNiLIW6qyfLNTp8tcAPpWG6fusuNRZ1COa50jdL3urg9WeGCkuSqdK/sk4rQElHuOye2A4OyR8uO1W/5Q7OMS+3CPIC4zBR4goMldQOFPzDFX6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZLpYGg9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZLpYGg9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5300bdf61d9so24274941cf.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626715; x=1789231515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGsQP05BVP7HKqk9s+jX5IUhEyQb2OXorpPQmD8qdnw=;
        b=nZLpYGg9E+WSuGsKzK8StllPi/EVq4Q+3sT6uVSccV+s9MpgtcwPIuqmLHwF1TgJcr
         PNtvZ5zb/h/cPA1/pAyMmfxIBlXw+gjv1U75OoZBAjCZbJEwCF2t8cyBZjcjgdvleMM3
         ZKloj9Kq5lzvJlwq7VlPBdRVSVuCBBFoggbLJFjFOxolZRJLqZaT3DoY1Dfft+4xU6iJ
         3/yr8FaLKKGeeKT4+2t8cZST04e7saYMayVJm39j/RmaHts70s4QixzmhTmvu4ZNdXHo
         Qa/aOi9e/wcqtH7+PiBCZDi/Jc5Mv2RKL3/L2hqKRmlUmoxxZg/UrxgBKjRWDDjNOpY3
         +I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626715; x=1789231515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGsQP05BVP7HKqk9s+jX5IUhEyQb2OXorpPQmD8qdnw=;
        b=TsTGQ2fj0mDrd/IJfBWHsi2bn6AHsrINCazTMfvrAeh9QGy3ts4Fn8OsBYLqxriL+H
         Fn43GAw45I3ZFB/8mu5x8F/4r5uJSb1GjQbfHZbWxSNTNnlrCrx1KtCpoEWSkYrYIyyG
         gYfrExLqODA2W40Zn3LZnASb7TEB3zkawp7aTh5OQfBX3MzZZuJGrcwAeyrQ0ixM/R/Q
         5bdRAvBLzWRPjcdm6HnMFmzpoo9yYeHgVU9RApzV/3mxC7Q1EljcuyeqkoaOww6r7e6W
         uVFeo02be/smZr/eVUHzZzTH0PkDY5IvPqmX8P4Fp3RZov/0CzUN1I36CZ7zfxBszZZl
         1vbw==
X-Gm-Message-State: AFuF++lMQD46AKPQLLekztoeRHE+ToV1IPxpnAvH72LI7NteXvMRHIb5
	9kfGl8+k1LXaXucJLRSNp5J8llN2dHKusqajiXXlaCc+jIMRnrGSBTCc
X-Gm-Gg: AYBFou0eUHjtUapasNCf00ATA8RM+tg/yfBm4F8g6RgalD+wxMAPGTjpjW91pmsANx0
	Ow2drrDxnEc2+chN1etpIRQVzblzI6mpBJJBOGIm1VAUsX3lRU+3j6H92za0Q9Zz0AZWLqM/RPq
	eNyok4CN9PGdThq5KCdJCvjFQcNh+cVYtIByWYmwvpOh9PWq5gcuxTeIXxpYZ4C83vxn1jKuLpp
	A/+QBh5IE16vFMdwJBza3sJv5oAKNI/RDmomup/Wb5KS16NI5G+k0EoUUBHeAvqou6uo5QJYtq6
	Oz27F9NstHsBK6ESNjr+pXJkqUIBgKGtjVW3luKsypcZlA9h3muwT6Ea6gWYF4HyWi9Fy09aHYM
	l94H9F1WUs1TysL9D2ZKLGIcvbVnE/sTs9LMrBuMiXQ4iIjJgl1JeCn9wU440JxtUeN0vFWk3Om
	0ikWu/6ZH0V51zuhKicNGnX4UhZJGoiV54zWD9WVb22Q8UyU9CYyNVMwV+NHXZGUx2OQn8zYzP/
	Ju4tJe6X5Sq6axzRVevq7VlI4w=
X-Received: by 2002:a05:622a:1493:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-530549f8c81mr144088371cf.39.1788626711978;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067ac52sm48984326d6.27.2026.09.05.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: host: fix props[] overflow when all quirks are enabled
Date: Sat,  5 Sep 2026 12:44:48 -0400
Message-ID: <20260905164448.209348-2-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905164448.209348-1-davidcollin899@gmail.com>
References: <aptV-QHKGbMqw1uP@vbox>
 <20260905164448.209348-1-davidcollin899@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

props[] is sized for exactly the number of properties
dwc3_host_init() can populate, leaving no slot for the NULL
terminator property_entries_dup() requires when usb3_lpm_capable,
usb2_lpm_disable, and the <=3.00a PED quirk are all true. Size
props[] for one more slot.

Fixes: 8da7644493b4 ("usb: dwc3: Specify maximum number of XHCI interrupters")
Cc: stable@vger.kernel.org
Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 74117cbb2f42..cd1e5204ac3a 100644
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
-- 
2.55.0

