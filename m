Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B6D19D8BC;
	Wed, 15 Apr 2026 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235308; cv=none; b=sUbOpp6okQXHHl3thEH9QE3kl7uATzpTvGEnypN56OF9x58BO0KMm2oBr+2YiRDS8NfXkX1q5B/JRFOLHLyNicvqoaMj5x8uO1rJtDKx26w6gSfhUSco0jAtpdaJAOBhn9XyBa/brEY5tBpgTDiHW1hmNWXa5voZ+rEPQ2uKJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235308; c=relaxed/simple;
	bh=Jpm1z6JzqxFYAqLP5UZIZdaW+uhwuoPafdNc8vOYW8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2/SWa7Ki4bUGPcgyyHz1EKxQe2ieNwB4WcsaN8KGRubb3S6qmei/XVwBgjIhUIXPTvt3iV8fMlUaSxLV7NGlewjnF7xQoiuNJ6Wo4kSBBM7GqUXdjUQfjXoQPCAk04gW3VT0anc8BzsENfDJpUh8qtpJXnlC+AtPhSUkrcY45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006493LT.eswin.cn (unknown [10.127.112.153])
	by app1 (Coremail) with SMTP id TAJkCgD3jHH6Mt9pAN0RAA--.7016S4;
	Wed, 15 Apr 2026 14:41:01 +0800 (CST)
From: caohang@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Hang Cao <caohang@eswincomputing.com>
Subject: [PATCH v2 0/1] Fix EIC7700 USB reset's issue
Date: Wed, 15 Apr 2026 14:40:56 +0800
Message-ID: <20260415064056.1757-1-caohang@eswincomputing.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgD3jHH6Mt9pAN0RAA--.7016S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYR7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY02Avz4vE-syl42xK82IYc2
	Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjfUOxhLUUUUU
X-CM-SenderInfo: xfdrxt1qj6v25zlqu0xpsx3x1qjou0bp/

From: Hang Cao <caohang@eswincomputing.com>

Fix EIC7700 USB reset's issue

Changes in v2->v1:
- Update commit message.
- Link to V1:https://lore.kernel.org/all/20260407061703.1564-1-caohang@eswincomputing.com/

Hang Cao (1):
  dt-bindings: usb: Fix EIC7700 USB reset's issue

 .../devicetree/bindings/usb/eswin,eic7700-usb.yaml         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--
2.34.1

