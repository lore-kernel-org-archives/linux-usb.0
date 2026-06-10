Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA13F408630;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097768; cv=none; b=QJJo3sBDUk3mDZGwltLcHc+vdd1dLjbQ97qQsj7uNNiyCKHdueQO4i0WyItXKnbW6rd0vM44mQZeAxT1cUJSjqAI/nQEnO30Ni301ic9LAkEEM3cSD9Nc1JWe/WmrQ5mYJYtQcQWXNoeZ2HDVktxGIhicPZwh/cuBep9zVUAVl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097768; c=relaxed/simple;
	bh=5rt9Ke0m4J6sZuKeN02wbGhbALpTt2a5TPCcm5Pzabc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qrdja97CLd43++0zqZj+jkZtgm8bWZ1V8+cCA7rHoA42ioBccOAbd6Cbh7Ko6kgK8WdA0YU9+scl74MwaVaICOZsg6jbnlQ53mf7PqgeYYskTvKrXke5ndZUk3RR4qHL9PK9k6KMx4rBjjJIZtCEVLZ2fcMRj6v8hEECnr53vC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMzYKtPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMzYKtPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3971F0089E;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=1jfv8R7z1GyHiUBfB/6PcUM1GOYS3CKOwMeL/w3W2nA=;
	h=From:To:Cc:Subject:Date;
	b=iMzYKtPoG/pE1v0UvcbV+V3RygygrpC9I67TcTWsi6n9zbJCm+arvA4Zt9MDP3Wlu
	 krBRkFqLsfy5Rii9t86p2Wyp0/3LmGLjZYxxlYvFfyXz/jRZV0qDBPq4cUdLWmdSJV
	 axhPKlFvLd+/E+YT/uYtZE28b65GDdnJW0lDqSgTUPe3vTrg4vI5jYO1vd7sg7yLv8
	 KT5o0zy19LHa2qBvnTRY99D3g1eKz3bX7BaTyQOyxA0rLVKEyigzQA3WA+F8ssMYxq
	 6up57riPVIg43V04mT6XqpTBsx8tnlTiZIUCh3MgRZ3Q7cPXodeL0AD83QlCniOsHF
	 1K/PcXRMlp5OA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001Uex-1O0P;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] USB: serial: digi_acceleport: registration fix and cleanups
Date: Wed, 10 Jun 2026 15:22:21 +0200
Message-ID: <20260610132232.356139-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a port registration ordering issue and makes the
driver stop all I/O when the device is not in use, while cleaning up the
driver somewhat.

Johan


Johan Hovold (11):
  USB: serial: digi_acceleport: fix port registration order
  USB: serial: digi_acceleport: drop unused wait queue
  USB: serial: digi_acceleport: always stop write urb on close
  USB: serial: digi_acceleport: add oob port helper
  USB: serial: digi_acceleport: clean up declarations and whitespace
  USB: serial: digi_acceleport: drop redundant driver data sanity checks
  USB: serial: digi_acceleport: stop OOB I/O when not in use
  USB: serial: digi_acceleport: drop unused in-buf define
  USB: serial: digi_acceleport: clean up xfer buf length expression
  USB: serial: digi_acceleport: clean up write completion
  USB: serial: digi_acceleport: clean up inb command submission

 drivers/usb/serial/digi_acceleport.c | 299 +++++++++++----------------
 1 file changed, 117 insertions(+), 182 deletions(-)

-- 
2.53.0

