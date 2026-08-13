Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8B48665F;
	Thu, 13 Aug 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635031; cv=none; b=uu/qrX+Icpr4XCBKRnPlZs7w1piBEoVWolkPg7x+xuAO7MJXKz4dHlPEhL1xefvU8Tdz5gSH3A2+45iuzwzhoF+9kE5uudPPwdR3h4GVQco6x7v/Jq2I4YHYoIuAHlhzXcrxxX6d/YNDgayjMHCQt6E8mO2G2eCbwy6VMzQTsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635031; c=relaxed/simple;
	bh=D7VofKSnl/qn3MQyqgWvMHmsWoXj80TIKWLmXlHgGaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GBXNF5mO66lIytT+R/rXmaT2QYci4/MS04gMwXfa/qjoAMoL613D7jLUqnIiWpQ4YFIe9ZTvpeaVj2MSxh967h3hdBlZa5EBDFfoNsmGtv3IBSfqExx+3P9nLSnPtE+HjZIiv2p2l6rF+A+Ds53CliVY2Y32L2R/+Zb1V92tt1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8O431qNNB5BQ--.14364S2;
	Thu, 13 Aug 2026 23:30:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 0/2] usb: musb: da8xx: pair OF child population
Date: Thu, 13 Aug 2026 23:30:21 +0800
Message-ID: <20260813153021.38834-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXq+8O431qNNB5BQ--.14364S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4kuF48Jw4xCF4xXF4Dtwb_yoW8JFyDpF
	W5G34akr4DG3WakayUuw47u3Z5G393JFZ8JF98Jw1fuw13Wr1UGryIyayjqrnxCFZ2kF4F
	qr45t3WvqayDCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2YLD
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

da8xx_probe() publishes CPPI child devices with of_platform_populate().
Those children are owned by the DA8xx parent and are not removed by
unregistering the separately created MUSB platform device.

The two patches intentionally cover separate lifetime exits.  Patch 1
unwinds partially or fully populated children when probe later fails.
Patch 2 pairs a successful population during normal driver removal.  In
both paths, resources are unpublished in the reverse order in which the
driver made them visible.

Changes since v2:
https://lore.kernel.org/all/20260715135916.24417-4-pengpeng@iscas.ac.cn/
- split probe-failure cleanup from normal remove cleanup
- document ownership of OF-created children versus the MUSB device
- cover partial failure from of_platform_populate()
- preserve reverse publication order on every exit

The series was reviewed statically against the current tree. I do not
have DA8xx hardware for bind/unbind testing.

Pengpeng Hou (2):
  usb: musb: da8xx: depopulate OF children on probe failure
  usb: musb: da8xx: depopulate OF children on remove

 drivers/usb/musb/da8xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a

-- 
2.50.1 (Apple Git-155)

