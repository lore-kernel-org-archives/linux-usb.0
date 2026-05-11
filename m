Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0C25F7A9;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=jLvhiX7IbzwK3gE8wcXFKE3fO/vAVS0Ut3vBi7XmWD4d750hRQdPH1/kMTcCHyNaktC3ZyKSZiFTv5HipAdqmwFw4UdOR4DL4enyntRStpO9LUsY7HCsjO6hWTUv6y5Nr6IxwfEpu1zFVrrr7XyVSq27PID9y0Zom1jP2TTeJCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=Cbn4z2KdhmAgu9bMstvySlKPcP1KqB5K8WSBVNvJhGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZK+35tdHCtaK+LdJPX0V3wZNqaAS78avML715Aq/SdU+rsKfyNEyJB7g7zQEphmZYbU+dK1Xh16oSmrS21mMXjhx9neMnJRamrB59ZJmQ3CLf5RZS0F9qNjEzZRiNQH3LVyQSj6K5S/sx6Wq/jr7tBA2AhF6lK+wuqyeWyvVpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNC1tOa+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNC1tOa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88AEC2BCB0;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=Cbn4z2KdhmAgu9bMstvySlKPcP1KqB5K8WSBVNvJhGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNC1tOa+LSmb4lNADchUYJ66luNsXJoI196gnK0SIJBTsFRJQmBMj3+f/K8TddqWe
	 ZnYfmI4BRwKjoeFpy9HK/Oq9QEUlEoe9NAoDlqLhNVi3MIrtLvzpAq5YZee+qcolt7
	 Ko+TPQ8AiQUwMlh+LWyeUpee30PLDpx+WJeSkwWX8O7mMnXDfkljaIQ1XXCl9tNz61
	 vKeON97z0UJHxhbRFZ3EO1qZJYqiT2D0SZRq4oDepTcamW6vu9JbfLzHdH3wMOMc1N
	 ZbizXgbvIM0hBSkT/sRyo4Z6trKI0a0Mf+NgLfQ6wK5rkLCZNQdGPo1rhouvcwsSAG
	 ElawgE4qdWyvA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCP-2rnd;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] USB: serial: xr: add missing uaccess include
Date: Mon, 11 May 2026 09:14:43 +0200
Message-ID: <20260511071448.611875-4-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing uaccess.h include, which is needed since TIOCSRS485
support was added, instead of relying on the header being included
indirectly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index 9fc4082de770..352c765d8803 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
+#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/cdc.h>
 #include <linux/usb/serial.h>
-- 
2.53.0

