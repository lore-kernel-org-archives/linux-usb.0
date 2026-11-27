Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788745;
	b=Ldh5bQYlBEj15A2VZtTu5bTHVfI+X4w1v5rk16a4vyUp6oT1En3+2AiBF03wSwEALR6L
	 H9i13E+QkeWIfdcKzifoqZnPGKbIL19RQN0re82Ts445WhkxtS53ZNqGeZY7eHswtwj2f
	 rHSQ2IbG8cX9tL1j/By9phEPFWytPhE3s5v76DwbHCHiWLE9WBY/ypYTRK893mP6bWHQ3
	 DYb8a7bx5kjZki9uo83fqn/4Uca/+gkXVp6WtLAbh89JM0B28QLOmGxXjXqXr3vlaZaRV
	 Vjk9xkTm1cfqPrxLvlqQqUpfruTaGYkAeSOm8w8I0NNSoCRvgxGBymFI9hNoIpBjihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788745;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4wizBbpem3+glW/CBA3fXwLz8YgeZA2FykyHPMS2uVE=;
	b=aD7LwPGOaiDgzzSbCB+HAbjG0R97YZ4H1pIQ2R8HKiIZOZkMQTZ8j7R4orbgcFNdB8at
	 yUCNbKIoSXvp3w/Uh40jf0k6QYAAjcB+/b09PtHgDdpomWg9dIr90eVjZWEa2AeXhjfjf
	 QRxOCurnQBTj1qIMnwlZ/fA33jtHETe8vR8H3io1hVbBKt+0b6aTQkxgRBFgSAI/v7/0D
	 /DFXBX4KHRJn0Oex7eAo38Solhu6b/lAAEZnG2f2ZU66QzUK0XtGoMwb/RcoLm1zpvn8w
	 9i66Lr20e087EIvAHuWTFNVNa+RUZf8ZlExN7c8yPThAagzYuNb1S5XNJE/Z6c5b3yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQk5vL4+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D1606A31C;
	Fri, 27 Nov 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQk5vL4+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BBE1F00898;
	Fri, 27 Nov 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788744;
	bh=4wizBbpem3+glW/CBA3fXwLz8YgeZA2FykyHPMS2uVE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DQk5vL4+AXG2dv1bhuT4qB/6q3FQSnSCCFRCKrcTgLjCSxSDXHX4b5kMGj/U/Beie
	 5KLpHNA/r7aJbDZYl8+BPZmIWBmoMkUGnzJHk/qFKnZIAe1UGg/6KbJIs0h+9swjGU
	 iYLrKFO2cHMrX51GtAi6j3oDd8S16aWkzpH3l76ixVKVCrzBeBbsGnvwkBd2PgDgjH
	 xL7tF/LJLyKXXguKMQx72/7Eu8d+mvLYLgliZKUSQ32XXng3mYIlfK6suCTM7+Qwbd
	 sgwJDuJeavDDLlGQ7LB1yJjZQ318sc3QwPV8ehPR6osotcC93JiNxtceStlVC8oO6W
	 oKo9SIjeP/Hkg==
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] phy: sunplus: don't read the disc_vol cell after
 nvmem_cell_get() fails
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: Vinod Koul <vkoul@kernel.org>, Vincent Shih <vincent.sunplus@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116074006.20357-1-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
Date: Fri, 27 Nov 2026 19:42:18 +0530
Message-Id: <179578873839.13164.16471147930433859862.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=mani@kernel.org;
 h=from:subject:message-id; bh=RG9xuVo72y8E28IbVX3jdTRczCWCBh/BRjwA3zgb3u0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCY/FzhupzgYfIPtncMHQhpmVv9Kl9kFf717zo
 8YYfI4CkBiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmPxQAKCRBVnxHm/pHO
 9bFiB/9O26qQZiJ/diHW8kJA1WQX1DbygHKRbExupaYfMzo1Yszy021CKvBX2YhJqWvvsSrHjum
 lWwScNdR2G+c1U7vuK1uaWB3OJwL71UVlQmK/jdkbd1uhbhrP4a91bqjjLCZUBQoiXp1t5mVj9P
 /U/DWv2pXgOh5/PhTbWZje2SNSwoJnolj54mBgUAHTjqQ8kj83fz15QgsDyiWt3vDJxOyaOyhLg
 k0N2n/U+TDI6btkDGhPtisBSQS3BOucGv6/YLBav4bR0rAWbrPgvuO5foIgVCmwD0a1ocUdIpJ0
 yo5mo/ZIaMlrzln8o7HdOqthqtromWmHMKdQLO2a1e49NGcW
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 09:40 +0200, Andrew Gaylard wrote:
> update_disc_vol() returns early only when nvmem_cell_get() gives
> -EPROBE_DEFER. On any other error, such as -ENOENT for a device tree
> without a disc_vol cell, it passes the error pointer to
> nvmem_cell_read() and nvmem_cell_put(), which dereference it.
> 
> Use the default disconnect-voltage level on these errors, as the function
> already does when the read fails. nvmem_cell_get() never returns NULL,
> so IS_ERR() is enough.
> 
> Tested on a Tibbo LTPP3G2 board.
> 
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


