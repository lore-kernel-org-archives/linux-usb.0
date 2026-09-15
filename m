Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEC4718DB
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462983; cv=none; b=r1zp7KIpMfn8kyAulddBcU8f3VYrjML9mzAK4iBRozNx+uN4ivqAGWc2Piutv84HqPnC9DLyNq1cLlO2tVlZuXj0xP2rvChr7d6lVoO2iQuw6lQEvFMQSkJ1Jt4hpUWM52OMyRUDYESGfkeAy958Be2gaLOYcsDxTe+3q265s1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462983; c=relaxed/simple;
	bh=SU0lEeXHIti5ysNgnJklZ5vgIPS1RNGl7D8jm31yYEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j82kEyV9yWiGvvQsjYmzvWq5pIXbePKuydDrQhjqoK9l2b/GVjsIdf39vNs/OijJw/JNPvTEpBUdg0j5kTzP3XkZIS6FZPYqDe0VBYBxAh5lQ1rz1BsX0zCkI3OCAUvqHLNvcIDny6IoERw8evovv9TMzpX8YFqGaWb7XKiWT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVkz5j77; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVkz5j77"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so9041266b.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=UVkz5j77RjpAaK0y/jNeuHj0ZHg+B1g5NmpH9THqtTxkiZ+uOZuYp0HIkjUqpO3l+5
         y9gM0JT0/m8yekq9HFO64OpAISrUSILIh4hPnwhcmitY6JBwptAeGjdvP7o77KvQ56Ys
         iEmR782OZA0Ha7ct7fZXkI8Au9Lo7d4XMtR88B9Aoh1eWTG8Ah6YtJb2NGQAId3EUQ+Z
         L1dU+O3NDj82gkz9KNA4lZ5PqUfK+A54UDlszBE08ilapTUtYu4mhbw+A+1fIiQW9Wk0
         MD2nVkuVBFXwzz2xysEHuL58H1j2vfF1u61QJ+hWTePudpdxc4H3Z8xCSfuw/0fx1A+C
         bBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=L50D+xxr8Q+zrhEMICX+hXFUOPPXxE+RMss8bFX8NGm/3nk3bHYm9t8MLk2eeF9Zxz
         GC6GGnlQj1Zwy7n8Agv3wYi+8Uhmwpg6P6/dlHzbTqRNEGspHppEJpz7QjZEmgeG3ToB
         JieZ07DreWgFLXrYS3cXtO1naUxrTQAtv47cuVD/QvqlMxaD/3wRsnfCQGryz7B6+SE2
         ngjxnaYlNTGJWEpxgtWh2nxIXU1DjYQM9sUpHsRRKDl2L/+EQoJwCTTC09FoSIel3Ird
         uQcm75LuNpMcagJcgZRrJ87RY/jttT4+/8kZI9SwTK2dh/ZvB0EneC7n157wtM5JrQuC
         WIuw==
X-Gm-Message-State: AFuF++mNwrBMrlv2N/HyfmhrY67nklR1fZUXA+yCJBuq5K5J24Qn5ePF
	ZZMCmZN8/dvAHQgVZztEqztI5QAYQv4yeE4Uorz/H7tSEao4LyruWGt6
X-Gm-Gg: AYBFou0+B2sj5Hg4mWL1YHmFVz76heUNP02G5DiFHXggaRzlnhsQz8V5UgY+AvlCbbC
	PD69yzP8Ew88yQcNkQZkdTSlFd902eH5OG9fqIL8SFsM7MCJx1ioG3XKKj3Bi/XMkhOWnnlwyDq
	rSq4CmBBIzMGSnFhxPc5+nShbxSjquRXvoz77uy3hFjOjpu9CDJY/zO10cTEEw8dZJBsmxrNO/Z
	wiMn6Fzr0q8ukB2fOB3F1LzPvBeOnMslSp+MIa+R8oQFzBUT1L0oOxv4r5ZQcrOuIFwe1g3Rdiz
	Ci+AIpO+qWQWXfEufAViHlGhHHDjaFbQSz/gzyWFlGsKLUr8rvKO/wQQhyWeMAP7uRlbDJRPMfz
	drkcZn7FaxtqxXmZFtD43wuKUUs8BBks0tJiLLrO/Z5oNRk1WuvP2Vl0s92xQ3RUUMmubW5jfNA
	YT9P94lVvjIYGAjXC2qzxZuqKYHyc0TYyTJbjg63Keyc7LzCAt9xg+8LEqjdwQdX3MILR/ExGdE
	aihCZEE38eCIhLB/HU8W/6vxVAc87ggHgUqLFkdVLhemp6mB0Ijfefh9y3gIQAwlljA76wmJP1l
	LN9z8Jew1gXykvuRCApcSRpvlniu/zS11/vp4TKfh4QCz5q5Ms1H9jm1Fi6YqFlho+Q1+vZ9++r
	ckl14UhicJqYP9DsPzWeo3+FX4gNwTPJQpqgdffG+VRIjJTHDm/a+jirDVrUazZo2YknPpxFBNu
	D2j7g9UuiY8bTTw1D0whkOAcgNDyDP1CqYLoXNLKNesH60Za6tlE92q9THSoVBfkmoTIwoG4wfr
	iq+iQEE3CU=
X-Received: by 2002:a17:907:3c86:b0:c29:60c1:7e55 with SMTP id a640c23a62f3a-c29d7794becmr17686466b.12.1789462979111;
        Tue, 15 Sep 2026 02:02:59 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 6/6] usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:23 +0000
Message-ID: <20260915090223.1346-7-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cdns3_plat_remove() calls pm_runtime_disable() on device teardown, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: f738957277ba ("usb: cdns3: Split core.c into cdns3-plat and core.c file")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index e3f32c3e9535..b85d5d1c48fd 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -219,6 +219,7 @@ static void cdns3_plat_remove(struct platform_device *pdev)
 	if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)))
 		pm_runtime_allow(dev);
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	cdns_remove(cdns);
-- 
2.47.3

