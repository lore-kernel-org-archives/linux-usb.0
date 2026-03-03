Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E93A8735;
	Tue,  3 Mar 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557717; cv=none; b=EHK9sABYcjlkpYNBPAJ9sE0br4E0RLziDQLq8svb39qT5b3rI5y67TH86vWFlcHsenq3cKif9N+b97IVM3MQMcs0LhRzoPuHyTNG/R1kR6Qk3fzdxeUzFjduhDj/MlptQkJ64H8+/CpC8oUPMkYhiQMjEgviHjJBzNt/YqPuuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557717; c=relaxed/simple;
	bh=4zifNHem/iHg5ZkMatzTpDHGSOyvTWSiqnd7UI8p0oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptM1G5LtKdfFGWITHV7fS/QSaFbZcVU5GxaXa4Non61Qkine/TpoH/DYohfvMUpiSxrAWQ/xMWwSv0AxCLXF26myRAEPcOkdpYTZHL7Xx7UHloq+UP5vwZ0Vr9mDMko9LFsCbbueA50EP7VnydeSlo1vMTcWU5TXCi5MevMTG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYSXhaov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYSXhaov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504B5C2BC87;
	Tue,  3 Mar 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557717;
	bh=4zifNHem/iHg5ZkMatzTpDHGSOyvTWSiqnd7UI8p0oc=;
	h=From:To:Cc:Subject:Date:From;
	b=aYSXhaovKjlhJc7aqL0xLFeKsiBmd8ykjKORN9HmQ4bXJ6iXYpRZrEbJ5lLXLvMe4
	 CteDfxitoA7vvmj1c7xBBP4FRC0YJPjIguMGgF0jiDBH0RAX7zIyB+uHRITrubh7YC
	 CYX94rwiGzRHZhMqisTmfcV/KE0UZpzcdItoZomPLX92FJDzdNcvoAjmzJ/xW3Qswb
	 8Yzd00HCvilaDHszc+Hdg0otNvDgABVGE6AEaamHefqWgQ94zVW8vbV2/pfj+n8hch
	 tBo1q0l3F2luwMy6F/oswB7PqyNSJrPLmW8wavAgoa1e+LRo9By9KVfgt2fyHQRA6a
	 KZeowqypfjM8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vxTEZ-000000001CC-0DrX;
	Tue, 03 Mar 2026 18:08:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] gpib: fix unintended binding of FTDI 8U232AM devices
Date: Tue,  3 Mar 2026 18:07:20 +0100
Message-ID: <20260303170722.4516-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I stumbled on this by chance when trying to jumping to the USB skeleton
driver probe function. Turns out this driver includes a more or less
verbatim copy of the USB skeleton driver.

This series drops the FTDI 8U232AM device id which is already handled by
the ftdi_sio driver and renames the driver symbol prefix to avoid name
clashes.

Johan


Johan Hovold (2):
  gpib: fix unintended binding of FTDI 8U232AM devices
  gpib: rename driver symbol prefix

 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 213 ++++++++++-----------
 1 file changed, 105 insertions(+), 108 deletions(-)

-- 
2.52.0

