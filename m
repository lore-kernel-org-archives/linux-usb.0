Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788761;
	b=irzqzF317bD6DIC0caGAfJgzwiq8xHZFrmMUX09diSDOi7u0qNfB2Ap3AuE1vh2cgTb4
	 Roh31LbAJeRUx9u45YPHno8MMIjv8ufqGavn5bKD4EMICivuO61Vb5Y7teeK4lKHYID6k
	 ylA+6cA1RF+FW7FZr7pInAHO0FONJQkPriNXyHbBy8WW32vCxpfojdgsrp6t6Stnhhjpz
	 XngOz+QuJX5TexuuJn8HuzDO/x3lC5SpHgHUYNI7TG/U7GOeIzFaThdCiYw/kH9JsKHzq
	 2f9PoTCYh2xVLaU5kv/FVtqvtfGwQ03vIK3PCDx7g/xdwayCPpfXLJhNGjl/YvT4NZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788761;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1DQ1nz3FbfQyhF7fIMEkTuu1coO+N7mSNr9rr0G9b4A=;
	b=CSdgbG8axSQL9CMIaf9k1HSumPynOdxdrbvSfgsiBKZL2JwblHpuMYPwdNI6D6rXpHGm
	 X91Nf3LZTy4kC3Rqt/Tfhy5Ff+wLzKDjm8syOiX3tN5iY4xnTTevMFn6qjDlquTIqC1b0
	 wxUqtVQLS8ajxVPY5z0StiLlObu9Ao1wUNUXNiIz7qr3b2wnHWpa1k8bjGUUCNdez0awG
	 vuJxi7G7oQ3D1EMT4pU++Ck6BadRBvKf9K52mwccTLOBGLY4A89YRx5JpebEC7SeGN7Vz
	 Y+dONtg7dMX41vZAL5TJNopR85glojuFIHo5ofGHcPGpfqGh0IxUqxrXvBuY7PqIZ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC30D2PR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286A606A31C;
	Fri, 27 Nov 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NC30D2PR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08ECA1F000C1;
	Fri, 27 Nov 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788760;
	bh=1DQ1nz3FbfQyhF7fIMEkTuu1coO+N7mSNr9rr0G9b4A=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NC30D2PRrbHcohcdRx2B2/PU8ynMc6s66Qo78TEwSrrii16Po8O/urYQz9w61EV6q
	 VEJ4XzHxKdTYTjPn75evJpa28LqjzudsbtKqsdH0crHmMmsdlMZyAm/6wwrCkBBgAb
	 t338uoLc6pv4UtxkjqWVZAmnFwqqbOVNyJ20EbPK/7Z6ihaecD36zK5wklxWQeHkeP
	 qpkgfXdsbocVr4C2ml8RuTtg4BTquozwdj7AxYU7OP1HWsRjazDV4ACGa6bp7T8YBq
	 jAll54AKZbyML4pwVBfGn3lFn1IUHtY6wGvwjt+lYkxT/+yIBlMkGEUWXbsb9pQ+Py
	 2McCwdEMlscxA==
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
Subject: Re: [PATCH 2/2] phy: sunplus: free the disc_vol buffer in
 update_disc_vol()
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: Vinod Koul <vkoul@kernel.org>, Vincent Shih <vincent.sunplus@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116074006.20357-2-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
 <20261116074006.20357-2-ag@ffroot.co.za>
Date: Fri, 27 Nov 2026 19:42:34 +0530
Message-Id: <179578875453.13164.15057967798026543763.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=607; i=mani@kernel.org;
 h=from:subject:message-id; bh=e/G7k6Ug5xqWaDsGPI4SQ10huVRNr22gaB2sqBJLzUA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCY/VRHZwP2uz0WvkFC1XzaEA+WVitAw+kxyX3
 EuQeVJPe8qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmP1QAKCRBVnxHm/pHO
 9ajpB/4qnHoRxivII0iWGeaMyEW77fVthG4IWia9xwjsTQdQwKodbRNUdCd9o3ldyMg1oVgbmdu
 ezmAZTM2f3h/jzGWMPgp3Tfmoa4hR0PIPhKQ4kwg1dzgkyPEGLlIObKHKu97SKfYH/EZ4B9m6Ke
 x9mZjFndTslTmFc3G2Zs47z3pNXPWMSdbKq2raTokafAPt8SAgh+qSB4BwWSG6k+mLTSKUJOK+V
 LVfd7sxrOzUKI/+hAtnY4agFqWEq3hNVIbpXAWtm/cfJwLC76fomB60TEyfAo9xez0rLkn1PnR1
 IzwUDU7GZMmMzO5m0MX1n26/J27A2JPyMOwbHosx8DemUYg5
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 09:40 +0200, Andrew Gaylard wrote:
> nvmem_cell_read() returns a buffer that the caller must free.
> update_disc_vol() never frees it, so every PHY initialisation leaks
> it: at boot, and again each time the EHCI or OHCI driver is unbound
> and bound.
> 
> Free the buffer after taking the disconnect-voltage level from it.
> 
> Tested on a Tibbo LTPP3G2 board.
> 
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


