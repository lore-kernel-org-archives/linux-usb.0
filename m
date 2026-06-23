Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C968B26158B;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228118; cv=none; b=mb5AETFqKZVZRKduj5fRIf1u/av749vZmpQCsTdqWdDOT1E2hBJQbjX2D241sD7+gRFWhjK1PvXiNjGR5a68viNyNVSQvYOJV8WK7TCWIDPqGEJg+vTjxyA8BFZWEo9Iheni8sQXKsibJ6B3h/aKDT6xGcZ4QdB314EuM0xWvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228118; c=relaxed/simple;
	bh=PGnxC0tEXycNFzu29Op8+09HeP/c4FldXBJBEXBccOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaOFpeKYQLqOK455kEi9OI8l9O/jUwqrJgPFjgUuO/k5v5mXfLWD7CuSHEbF7YnXQ3ZRcXPSFX92PaBE9ytxO7eJEzYcps/FavUYwp0tF5r+ZSolmHPzjK4xZkZj+x8/Mv0gC1Oe35t/ae008Nzg0zXcAFZQOvDrIQKl3RKpVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQt5yYhW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQt5yYhW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FA51F00A3F;
	Tue, 23 Jun 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228117;
	bh=+EIrGB2u23lpSdyBOTKnv/Hl75aC0Sb9RX4M877OcFk=;
	h=From:To:Cc:Subject:Date;
	b=nQt5yYhW9uqE5R3P5n7YrxGmXC0VMLPsUtTfu36QJt9xcXL5r8cC03+dJgdh2LBsu
	 rnxPolWovTxG67rKO+zeFsBJ6r8BuieV5IcOnP7XOzw0f84xiCyTppsVctfC4I7GLQ
	 9llevONGwvOpUcENrlelc6FtXDQbWi8QA40jVBbRoXwZ3CIOBEche5LFLXI4hbLWZl
	 DthAMq/6TvVYQqw59YDtB3FoGSVOBfPEif6QVRW0gZTl0vJMmj5kxHM396ZVUlNGX6
	 zJcBjv5SDDoR/ZgiWv/dNxUrYzzLwH9lVIKp+BLOE9x5mSxRWfCT5X7GkbQDM6xXNh
	 dRQ8OkuLHnZiw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2wl-00000001KFZ-0FkQ;
	Tue, 23 Jun 2026 17:21:55 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] USB: serial: metro-usb: fix unthrottle race
Date: Tue, 23 Jun 2026 17:21:45 +0200
Message-ID: <20260623152148.316149-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a mostly benign unthrottle race. Included is also
preparatory patch replacing an unnecessary atomic allocation and a
related variable declaration cleanup.

Johan


Johan Hovold (3):
  USB: serial: metro-usb: replace unnecessary atomic allocation
  USB: serial: metro-usb: fix unthrottle race
  USB: serial: metro-usb: drop redundant initialisations

 drivers/usb/serial/metro-usb.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.53.0

